# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  $('form[method=get]').live 'submit', (event) ->
    event.preventDefault()
    $.pjax
      container: '[data-pjax-container]'
      url: this.action + '?' + $(this).serialize()
