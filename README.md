# Mitremedia Sentence Tagger

This is a proof of concept on how a simple sentence tagger could look like.

You can access the demo app on this link:

http://mitremedia-sentence-tagger.herokuapp.com/

## Demo

https://user-images.githubusercontent.com/3678598/194963436-19ed35d0-8229-40d4-961d-4c8e167e2b88.mov

## Technologies used 🤖 

- [Ruby On Rails](https://rubyonrails.org/)
- [TurboLink](https://turbo.hotwired.dev/)
- [TurboLink](https://stimulus.hotwired.dev/)
- [Tailwind CSS](https://tailwindcss.com/)

## Dev setup 💻 

1) Clone repo

2) Run migrations: 

```
rails db:migrate
```

3) Run seeds:

```
rails db:seed
```

4) Run dev environment:

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
- Use vite ruby + vite rails for a slick dev experience.
