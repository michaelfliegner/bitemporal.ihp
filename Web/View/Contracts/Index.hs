module Web.View.Contracts.Index where
import Web.View.Prelude

data IndexView = IndexView { contracts :: [ContractState] }

instance View IndexView where
    html IndexView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item active"><a href={NewWorkflowAction} data-turbolinks-preload="false" >Contracts</a></li>
            </ol>
        </nav>
        <h1>Index <a href={pathTo NewContractAction} class="btn btn-primary ml-4">+ New</a></h1>
        <div class="table-responsive">
            <table class="table">
                <thead>
                    <tr>
                        <th>ContractState</th>
                        <th></th>
                        <th></th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>{forEach contracts renderContract}</tbody>
            </table>
        </div>
        
    |]


renderContract contract = [hsx|
    <tr>
        <td>{contract}</td>
        <td><a href={ShowContractAction (get #id contract)}>Show</a></td>
        <td><a href={DeleteContractAction (get #id contract)} class="js-delete text-muted">Delete</a></td>
    </tr>
|]
