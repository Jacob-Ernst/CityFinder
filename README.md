<!-- Improved compatibility of back to top link: See: https://github.com/othneildrew/Best-README-Template/pull/73 -->
<a name="readme-top"></a>
<!--
*** Thanks for checking out the Best-README-Template. If you have a suggestion
*** that would make this better, please fork the repo and create a pull request
*** or simply open an issue with the tag "enhancement".
*** Don't forget to give the project a star!
*** Thanks again! Now go create something AMAZING! :D
-->



<!-- PROJECT SHIELDS -->
<!--
*** I'm using markdown "reference style" links for readability.
*** Reference links are enclosed in brackets [ ] instead of parentheses ( ).
*** See the bottom of this document for the declaration of the reference variables
*** for contributors-url, forks-url, etc. This is an optional, concise syntax you may use.
*** https://www.markdownguide.org/basic-syntax/#reference-style-links
-->
[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![MIT License][license-shield]][license-url]
[![LinkedIn][linkedin-shield]][linkedin-url]



<!-- PROJECT LOGO -->
<br />
<div align="center">
  <h3 align="center">CityFinder</h3>

  <p align="center">
    Find info about the city nearest to you.
    <br />
    <a href="https://github.com/Jacob-Ernst/CityFinder"><strong>Explore the docs »</strong></a>
  </p>
</div>



<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#license">License</a></li>
  </ol>
</details>

<!-- ABOUT THE PROJECT -->
## About The Project

Ruby on Rails API project for finding information for the city closest to the user-provided location.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

### Built With

* [![Rails][RubyOnRails.org]][RubyOnRails-url]
* [![Docker][Docker.com]][Docker-url]

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- GETTING STARTED -->
## Getting Started

To get started, make sure that you have the [Prerequisites](#prerequisites) installed.
Then follow the directions under [Installation](#installation).

### Prerequisites

- [Docker](https://docs.docker.com/engine/install/)
- [Task (available in Homebrew as "go-task")](https://taskfile.dev/installation/)

### Installation

1. Clone the repo
   ```sh
   git clone https://github.com/Jacob-Ernst/CityFinder.git
   ```
2. Create a copy of `.env.example`
   ```sh
   task build:env
   ```
3. Copy working ENV variables into `.env`
4. Setup Docker and install Bundler dependencies
   ```sh
   task dev:setup
   ```
5. Create, migrate, and seed local database
   ```sh
   task db:setup
   ```
6. Run the API to see if everything is working
   ```sh
   task start
   ```


<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- USAGE EXAMPLES -->
## Usage

To run the project for local development run the following:

```shell
task start
```

The server should now be accessible by visiting: [http://localhost/](http://localhost/).

To find city data, you can make POST requests to [http://localhost/api/v1/cities/nearest](http://localhost/api/v1/cities/nearest).
Use the `nearest` param to provide an address, a city, a state, or a zip code.

To stop the project run the following:

```sh
task stop
```

### Testing

We use RSpec for unit testing. To run the test suite for this project run the following:

```sh
task rspec
```

<p align="right">(<a href="#readme-top">back to top</a>)</p>


<!-- ROADMAP -->
## Roadmap

- [ ] Feature 1
- [ ] Feature 2
- [ ] Feature 3
    - [ ] Nested Feature

See the [open issues](https://github.com/Jacob-Ernst/CityFinder/issues) for a full list of proposed features (and known issues).

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- LICENSE -->
## License

Distributed under the MIT License. See `LICENSE.txt` for more information.

<p align="right">(<a href="#readme-top">back to top</a>)</p>


<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/Jacob-Ernst/CityFinder.svg?style=for-the-badge
[contributors-url]: https://github.com/Jacob-Ernst/CityFinder/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/Jacob-Ernst/CityFinder.svg?style=for-the-badge
[forks-url]: https://github.com/Jacob-Ernst/CityFinder/network/members
[stars-shield]: https://img.shields.io/github/stars/Jacob-Ernst/CityFinder.svg?style=for-the-badge
[stars-url]: https://github.com/Jacob-Ernst/CityFinder/stargazers
[issues-shield]: https://img.shields.io/github/issues/Jacob-Ernst/CityFinder.svg?style=for-the-badge
[issues-url]: https://github.com/Jacob-Ernst/CityFinder/issues
[license-shield]: https://img.shields.io/github/license/Jacob-Ernst/CityFinder.svg?style=for-the-badge
[license-url]: https://github.com/Jacob-Ernst/CityFinder/blob/master/LICENSE.txt
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://linkedin.com/in/jaernst
[product-screenshot]: images/screenshot.png
[React.js]: https://img.shields.io/badge/React-20232A?style=for-the-badge&logo=react&logoColor=61DAFB
[React-url]: https://reactjs.org/
[RubyOnRails.org]: https://img.shields.io/badge/Rails-CC0000?style=for-the-badge&logo=rubyonrails&logoColor=white
[RubyOnRails-url]: https://rubyonrails.org/ 
[Docker.com]: https://img.shields.io/badge/Docker-2496ED?style=for-the-badge&logo=docker&logoColor=white
[Docker-url]: https://www.docker.com/
