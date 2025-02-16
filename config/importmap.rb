# frozen_string_literal: true

# Pin npm packages by running ./bin/importmap

pin 'application'
pin '@hotwired/turbo-rails', to: 'turbo.min.js'
pin '@hotwired/stimulus', to: 'stimulus.min.js'
pin '@hotwired/stimulus-loading', to: 'stimulus-loading.js'
pin_all_from '../app/frontend/controllers', under: 'controllers'
pin 'preline', to: 'https://cdn.jsdelivr.net/npm/preline@2.7.0/+esm'
pin 'trix', to: 'https://unpkg.com/trix@2.0.8/dist/trix.umd.min.js'
pin '@rails/actiontext', to: 'actiontext.js'
