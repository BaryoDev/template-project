import { defineConfig } from 'vitepress'

export default defineConfig({
  title: 'Project Name',
  description: 'Project documentation built with VitePress',
  
  themeConfig: {
    nav: [
      { text: 'Home', link: '/' },
      { text: 'Guide', link: '/guide/' },
      { text: 'Reference', link: '/reference/' }
    ],

    sidebar: {
      '/guide/': [
        {
          text: 'Getting Started',
          items: [
            { text: 'Introduction', link: '/guide/' },
            { text: 'Installation', link: '/guide/installation' },
            { text: 'Quick Start', link: '/guide/quick-start' }
          ]
        },
        {
          text: 'Features',
          items: [
            { text: 'Overview', link: '/guide/features' }
          ]
        }
      ],
      '/reference/': [
        {
          text: 'Reference',
          items: [
            { text: 'Changelog', link: '/reference/changelog' },
            { text: 'FAQ', link: '/reference/faq' },
            { text: 'Migration Guide', link: '/reference/migration' }
          ]
        }
      ]
    },

    socialLinks: [
      { icon: 'github', link: 'https://github.com/BaryoDev' }
    ],

    footer: {
      message: 'Released under the MPL-2.0 License.',
      copyright: 'Copyright © 2025 BaryoDev'
    }
  }
})
