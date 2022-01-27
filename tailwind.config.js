module.exports = {
  mode: 'jit',
  content: [
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/form_builders/**/*.rb',
  ],
  plugins: [
    require('@tailwindcss/forms'),
  ],
  theme: {
    extend: {
      colors: {
        'violet': {
          DEFAULT: '#090A39',
          '50': '#2226D8',
          '100': '#1F23C6',
          '200': '#1A1DA3',
          '300': '#14167F',
          '400': '#0F105C',
          '500': '#090A39',
          '600': '#010209',
          '700': '#000000',
          '800': '#000000',
          '900': '#000000'
        },
        'orange': {
          DEFAULT: '#F76B1C',
          '50': '#FDDFCD',
          '100': '#FDD2BA',
          '200': '#FBB892',
          '300': '#FA9E6B',
          '400': '#F88543',
          '500': '#F76B1C',
          '600': '#D35107',
          '700': '#9D3C06',
          '800': '#672804',
          '900': '#311302'
        },
      },
    }
  }
}
