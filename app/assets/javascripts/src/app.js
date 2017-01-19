import {div, button} from '@cycle/dom'
import Rx from 'rxjs'

function model(intent, responses) {
  return {
    buttonDisabled$: intent.buttonClick$.map(() => {
      return true
    }).merge(responses.partyResponse$.map(() => { return false })),
    createParty$: intent.buttonClick$,
    showPartyNumber$: responses.partyResponse$.map((response) => {
      console.log(response)
      return response.body.id})
  }
}

function responses(sources) {
  return {
    partyResponse$: sources.HTTP.select('party').flatMap((e) => {return e})
  }
}

function intent(sources) {
  return {
    buttonClick$: sources.DOM.select('button').events('click')
  }
}

function view(model) {
  return Rx.Observable.combineLatest(model.buttonDisabled$.startWith(false), model.showPartyNumber$, (disabled, partyNumber) => {
    console.log(partyNumber)
    return div('.stuff', {}, [
      div('.party', {}, partyNumber),
      button('.party', {attrs: {disabled}}, 'Create party')
    ])
  }).startWith(button('.party', {}, 'Create party'))
}

function httpRequests(model) {
  return model.createParty$.map(() => { return {
    url: 'http://localhost:3000/parties.json', // GET method by default
    method: 'POST',
    category: 'party',
    headers: {
      'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
    }
  } })
}

export function App (sources) {
  const i = intent(sources)
  const r = responses(sources)
  const m = model(i, r)
  const vtree$ = view(m)
  const requests = httpRequests(m)
  const sinks = {
    DOM: vtree$,
    HTTP: requests
  }
  return sinks
}
