<h1 align="center">
  <p align="center">
    <a href="https://app.travis-ci.com/github/mochetts/mitremedia-sentence-tagger">
      <img src="https://app.travis-ci.com/mochetts/mitremedia-sentence-tagger.svg?branch=main" alt="build:main">
    </a>
  </p>
</h1>

# Mitremedia Sentence Tagger

This is a proof of concept on how a simple sentence tagger could look like. 

I wanted to be as pure as possible by using RoR mostly as it comes out of the box. This is not how I would start an app that needs to be production ready. I would still need to dig a little bit more into StimulusJS best practices pros / cons. 

I took this as a glimpse at how the rails community wants devs to code their apps thse days.

You can access the demo app on this link:

http://mitremedia-sentence-tagger.herokuapp.com/

## Demo

https://user-images.githubusercontent.com/3678598/194963436-19ed35d0-8229-40d4-961d-4c8e167e2b88.mov

## Technologies used 🤖 

- [Ruby On Rails](https://rubyonrails.org/)
- [TurboLink](https://turbo.hotwired.dev/)
- [StimulusJS](https://stimulus.hotwired.dev/)
- [Tailwind CSS](https://tailwindcss.com/)

## Dev setup 💻 

1) Clone repo
2) Install gems

```
bundle install
```

3) Run migrations: 

```
rails db:migrate
```

4) Run seeds:

```
rails db:seed
```

5) Run dev environment:

```
bin/dev
```

You're good to go

## Architecture 📐 

The underlying architecture consists of three models: Sentence, EntityType, and Entity. 

These models relate to each other following this spec:

<img width="282" alt="image" src="https://user-images.githubusercontent.com/3678598/194962246-98cad82f-27c3-4e63-98ea-8bb5a8ffe2f2.png">

## Future Work 🔮 

- Add more robust integration tests such as cypress or capybara + selenium.
- Add the rest of the CRUD operations for sentences and entities (tags).
- Use [vite ruby + vite rails](https://vite-ruby.netlify.app/guide/rails.html) for a slick dev experience.
- Use something like [ActiveInteraction](https://github.com/AaronLasseigne/active_interaction) to avoid flooding controllers and/or models with business logic.
