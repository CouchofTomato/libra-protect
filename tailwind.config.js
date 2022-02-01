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
          DEFAULT: '#F9A631',
          '50': '#FEF3E3',
          '100': '#FEEBD0',
          '200': '#FCD9A8',
          '300': '#FBC880',
          '400': '#FAB759',
          '500': '#F9A631',
          '600': '#EB8C07',
          '700': '#B56C05',
          '800': '#7E4B04',
          '900': '#482B02'
        },
      },
    }
  }
}
