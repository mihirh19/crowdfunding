import React from 'react'
import ReactDOM from 'react-dom/client'
import { BrowserRouter } from 'react-router-dom'
import { ChainId, ThirdwebProvider } from '@thirdweb-dev/react'
import App from './App'

const root = ReactDOM.createRoot(document.getElementById('root'))
root.render(
   <ThirdwebProvider chainId={11155111}
      clientId={process.env.REACT_APP_TEMPLATE_CLIENT_ID}
   >
      <BrowserRouter>
         <App />
      </BrowserRouter>
   </ThirdwebProvider>
)