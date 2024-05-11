import React from 'react'
import ReactDOM from 'react-dom/client'
import { BrowserRouter } from 'react-router-dom'
import { ChainId, ThirdwebProvider } from '@thirdweb-dev/react'
import App from './App'
import { StateContextProvider } from './context';
import "./index.css"
const root = ReactDOM.createRoot(document.getElementById('root'))
root.render(
   <ThirdwebProvider activeChain={11155111}
      clientId={process.env.REACT_APP_TEMPLATE_CLIENT_ID}
   >
      <BrowserRouter>
         <StateContextProvider>
            <App />
         </StateContextProvider>
      </BrowserRouter>
   </ThirdwebProvider>
)