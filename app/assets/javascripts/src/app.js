import {div} from '@cycle/dom'
import Rx from 'rxjs'

export function App (sources) {
  const vtree$ = Rx.Observable.of(
    div('My Awesome Cycle.js app')
  )
  const sinks = {
    DOM: vtree$
  }
  return sinks
}
