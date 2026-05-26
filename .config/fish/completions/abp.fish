set -l subcommands \
    add-module add-module-source add-package add-package-ref add-source-code \
    analyse analyze build bundle check-extensions clean clear-download-cache \
    cli configure-hosts-file delete-module-source generate-jwks generate-proxy \
    generate-razor-page get-source help index-docs init-solution install-libs \
    install-local-module install-module install-old-cli kube-connect \
    kube-intercept list-module-sources list-modules list-templates login \
    login-info logout mcp mcp-studio new new-module new-package prompt \
    remove-proxy run suite switch-to-local switch-to-nightly switch-to-prerc \
    switch-to-preview switch-to-stable translate update upgrade watch

complete -c abp -f

complete -c abp -n __fish_use_subcommand -a add-module           -d 'Add a multi-package module to a solution'
complete -c abp -n __fish_use_subcommand -a add-module-source    -d 'Add a new module source'
complete -c abp -n __fish_use_subcommand -a add-package          -d 'Add an ABP package to a project'
complete -c abp -n __fish_use_subcommand -a add-package-ref      -d 'Add project reference between packages'
complete -c abp -n __fish_use_subcommand -a add-source-code      -d 'Download source and replace package refs with project refs'
complete -c abp -n __fish_use_subcommand -a analyse              -d 'Analyse given package or module packages'
complete -c abp -n __fish_use_subcommand -a analyze              -d 'Analyse given package or module packages'
complete -c abp -n __fish_use_subcommand -a build                -d 'Build a dotnet repository or solution'
complete -c abp -n __fish_use_subcommand -a bundle               -d 'Bundle third-party styles/scripts and update index.html'
complete -c abp -n __fish_use_subcommand -a check-extensions     -d 'Check and update CLI extensions'
complete -c abp -n __fish_use_subcommand -a clean                -d 'Delete all BIN and OBJ folders in current folder'
complete -c abp -n __fish_use_subcommand -a clear-download-cache -d 'Clear the templates download cache'
complete -c abp -n __fish_use_subcommand -a cli                  -d 'Update or remove ABP CLI'
complete -c abp -n __fish_use_subcommand -a configure-hosts-file -d 'Configure the hosts file'
complete -c abp -n __fish_use_subcommand -a delete-module-source -d 'Delete a module source'
complete -c abp -n __fish_use_subcommand -a generate-jwks        -d 'Generate an RSA key pair for OpenIddict'
complete -c abp -n __fish_use_subcommand -a generate-proxy       -d 'Generate client service proxies and DTOs'
complete -c abp -n __fish_use_subcommand -a generate-razor-page  -d 'Generate a Razor page'
complete -c abp -n __fish_use_subcommand -a get-source           -d 'Download the source code of a module'
complete -c abp -n __fish_use_subcommand -a help                 -d 'Show command line help'
complete -c abp -n __fish_use_subcommand -a index-docs           -d 'Index ABP documentation into a vector DB'
complete -c abp -n __fish_use_subcommand -a init-solution        -d 'Initialize an ABP Studio solution'
complete -c abp -n __fish_use_subcommand -a install-libs         -d 'Install NPM packages for MVC/Razor/Blazor Server'
complete -c abp -n __fish_use_subcommand -a install-local-module -d 'Install a local module to a module'
complete -c abp -n __fish_use_subcommand -a install-module       -d 'Install a remote module to a module'
complete -c abp -n __fish_use_subcommand -a install-old-cli      -d 'Install old ABP CLI'
complete -c abp -n __fish_use_subcommand -a kube-connect         -d 'Create a tunnel for kubernetes'
complete -c abp -n __fish_use_subcommand -a kube-intercept       -d 'Create a tunnel for kubernetes'
complete -c abp -n __fish_use_subcommand -a list-module-sources  -d 'List all module sources'
complete -c abp -n __fish_use_subcommand -a list-modules         -d 'List application modules from remote stores'
complete -c abp -n __fish_use_subcommand -a list-templates       -d 'List available templates'
complete -c abp -n __fish_use_subcommand -a login                -d 'Login to abp.io'
complete -c abp -n __fish_use_subcommand -a login-info           -d 'Show your login info'
complete -c abp -n __fish_use_subcommand -a logout               -d 'Sign out from abp.io'
complete -c abp -n __fish_use_subcommand -a mcp                  -d 'Run local MCP server and output client config'
complete -c abp -n __fish_use_subcommand -a mcp-studio           -d 'Start MCP server with stdio transport'
complete -c abp -n __fish_use_subcommand -a new                  -d 'Create a new ABP Studio solution'
complete -c abp -n __fish_use_subcommand -a new-module           -d 'Create a new module'
complete -c abp -n __fish_use_subcommand -a new-package          -d 'Create a new package in a module'
complete -c abp -n __fish_use_subcommand -a prompt               -d 'Start prompt mode'
complete -c abp -n __fish_use_subcommand -a remove-proxy         -d 'Remove client service proxies and DTOs'
complete -c abp -n __fish_use_subcommand -a run                  -d 'Run the solution using a run profile'
complete -c abp -n __fish_use_subcommand -a suite                -d 'Install/update/remove/start ABP Suite'
complete -c abp -n __fish_use_subcommand -a switch-to-local      -d 'Replace NuGet refs with local project refs'
complete -c abp -n __fish_use_subcommand -a switch-to-nightly    -d 'Switch to nightly ABP packages'
complete -c abp -n __fish_use_subcommand -a switch-to-prerc      -d 'Switch npm packages to pre-rc ABP version'
complete -c abp -n __fish_use_subcommand -a switch-to-preview    -d 'Switch to preview ABP packages'
complete -c abp -n __fish_use_subcommand -a switch-to-stable     -d 'Switch to stable ABP packages'
complete -c abp -n __fish_use_subcommand -a translate            -d 'Translate ABP resource JSON files'
complete -c abp -n __fish_use_subcommand -a update               -d 'Update all ABP NuGet and NPM packages'
complete -c abp -n __fish_use_subcommand -a upgrade              -d 'Upgrade solution to ABP Pro packages'
complete -c abp -n __fish_use_subcommand -a watch                -d 'Run solution with hot reload (dotnet watch)'

complete -c abp -n "__fish_seen_subcommand_from help" -a "$subcommands"

complete -c abp -s h -l help    -d 'Show help'
complete -c abp      -l version -d 'Show version'

# suite has positional sub-actions instead of flags
complete -c abp -n "__fish_seen_subcommand_from suite; and not __fish_seen_subcommand_from install update remove" -a install -d 'Install ABP Suite as a dotnet global tool'
complete -c abp -n "__fish_seen_subcommand_from suite; and not __fish_seen_subcommand_from install update remove" -a update  -d 'Update ABP Suite to the latest'
complete -c abp -n "__fish_seen_subcommand_from suite; and not __fish_seen_subcommand_from install update remove" -a remove  -d 'Uninstall ABP Suite'
complete -c abp -n "__fish_seen_subcommand_from suite; and __fish_seen_subcommand_from install update" -l preview          -d 'Use preview version'
complete -c abp -n "__fish_seen_subcommand_from suite; and __fish_seen_subcommand_from install"        -l version -r       -d 'Install a specific version'

# --- Per-subcommand flag completions (auto-generated) ---

# add-module
complete -c abp -n "__fish_seen_subcommand_from add-module" -l new -d 'Creates a fresh new module (speсialized for your solution) and adds it your s...'
complete -c abp -n "__fish_seen_subcommand_from add-module" -l with-source-code -d 'Downloads the source code of the module to your solution folder. (Always True...'
complete -c abp -n "__fish_seen_subcommand_from add-module" -l add-to-solution-file -d 'Adds the downloaded/created module to your solution file. (only available whe...'
complete -c abp -n "__fish_seen_subcommand_from add-module" -s s -l solution -r -d 'Specify the solution file explicitly.'
complete -c abp -n "__fish_seen_subcommand_from add-module" -l skip-db-migrations -r -d 'Specify if a new migration will be added or not.  (Always True if `--new` is ...'
complete -c abp -n "__fish_seen_subcommand_from add-module" -s sp -l startup-project -r -d 'Relative path to the project folder of the startup project. Default value is ...'
complete -c abp -n "__fish_seen_subcommand_from add-module" -s v -l version -r -d 'Specify the version of the module. Default is your project\'s ABP version.'

# add-module-source
complete -c abp -n "__fish_seen_subcommand_from add-module-source" -s n -l name
complete -c abp -n "__fish_seen_subcommand_from add-module-source" -s n -l path

# add-package
complete -c abp -n "__fish_seen_subcommand_from add-package" -s p -l project -r -d 'Specifies the project file explicitly. (Only available for NuGet packages)'
complete -c abp -n "__fish_seen_subcommand_from add-package" -s s -l solution -r -d 'Specifies the solution file explicitly. (Only available for NuGet packages)'
complete -c abp -n "__fish_seen_subcommand_from add-package" -l with-source-code -d 'Downloads the source code of the Angular NPM/NuGet package and make other pro...'
complete -c abp -n "__fish_seen_subcommand_from add-package" -l add-to-solution-file -d 'Adds the downloaded project to the .sln file, when source code is downloaded....'
complete -c abp -n "__fish_seen_subcommand_from add-package" -s ad -l angular-directory -r -d 'Specifies the Angular project directory explicitly. (Only available for Angul...'
complete -c abp -n "__fish_seen_subcommand_from add-package" -s v -l version -r -d 'Specifies the version of the package. Default is your project\'s ABP version ...'

# analyse
complete -c abp -n "__fish_seen_subcommand_from analyse" -s n -l name -r -d 'Package or module name'
complete -c abp -n "__fish_seen_subcommand_from analyse" -s b -l build -d 'Build before analyzing'
complete -c abp -n "__fish_seen_subcommand_from analyse" -s f -l force -d 'Force re-analysis, skip up-to-date check'
complete -c abp -n "__fish_seen_subcommand_from analyse" -l create-json-output -d 'Also write .abppkg.analyze.json files'

# analyze
complete -c abp -n "__fish_seen_subcommand_from analyze" -s n -l name -r -d 'Package or module name'
complete -c abp -n "__fish_seen_subcommand_from analyze" -s b -l build -d 'Build before analyzing'
complete -c abp -n "__fish_seen_subcommand_from analyze" -s f -l force -d 'Force re-analysis, skip up-to-date check'
complete -c abp -n "__fish_seen_subcommand_from analyze" -l create-json-output -d 'Also write .abppkg.analyze.json files'

# build
complete -c abp -n "__fish_seen_subcommand_from build" -s wd -l working-directory -r -d 'default: empty'
complete -c abp -n "__fish_seen_subcommand_from build" -s m -l max-parallel-builds -r -d 'default: 1'
complete -c abp -n "__fish_seen_subcommand_from build" -s a -l dotnet-build-arguments -r -d 'default: empty'
complete -c abp -n "__fish_seen_subcommand_from build" -s n -l build-name -r -d 'default: empty'
complete -c abp -n "__fish_seen_subcommand_from build" -s f -l force -d 'default: false'

# bundle
complete -c abp -n "__fish_seen_subcommand_from bundle" -s wd -l working-directory -r -d 'default: empty'
complete -c abp -n "__fish_seen_subcommand_from bundle" -s f -l force -d 'default: false'
complete -c abp -n "__fish_seen_subcommand_from bundle" -s t -l project-type -d 'default: webassembly'
complete -c abp -n "__fish_seen_subcommand_from bundle" -s v -l version -d 'Specifies the ABP Framework version that the project is using. This is helpfu...'

# configure-hosts-file
complete -c abp -n "__fish_seen_subcommand_from configure-hosts-file" -l records
complete -c abp -n "__fish_seen_subcommand_from configure-hosts-file" -l namespace

# delete-module-source
complete -c abp -n "__fish_seen_subcommand_from delete-module-source" -s n -l name

# generate-jwks
complete -c abp -n "__fish_seen_subcommand_from generate-jwks" -s o -l output -r -d 'Output directory (default: current directory)'
complete -c abp -n "__fish_seen_subcommand_from generate-jwks" -s s -l key-size -r -d 'RSA key size: 2048 or 4096 (default: 2048)'
complete -c abp -n "__fish_seen_subcommand_from generate-jwks" -l alg -r -d 'Algorithm: RS256, RS384, RS512, PS256, PS384, PS512 (default: RS256)'
complete -c abp -n "__fish_seen_subcommand_from generate-jwks" -l kid -r -d 'Key ID (kid) - auto-generated if not specified'
complete -c abp -n "__fish_seen_subcommand_from generate-jwks" -s f -l file -r -d 'Output file name prefix (default: jwks)'

# generate-proxy
complete -c abp -n "__fish_seen_subcommand_from generate-proxy" -s m -l module -r -d '(default: \'app\') The name of the backend module you wish to generate proxie...'
complete -c abp -n "__fish_seen_subcommand_from generate-proxy" -s wd -l working-directory -r -d 'Execution directory.'
complete -c abp -n "__fish_seen_subcommand_from generate-proxy" -s u -l url -r -d 'API definition URL from.'
complete -c abp -n "__fish_seen_subcommand_from generate-proxy" -s t -l type -r -d 'The name of generate type (csharp, js, ng).'
complete -c abp -n "__fish_seen_subcommand_from generate-proxy" -l without-contracts -d 'Avoid generating the application service interface, class, enum and dto types.'
complete -c abp -n "__fish_seen_subcommand_from generate-proxy" -l folder -r -d '(default: \'ClientProxies\') Folder name to place generated CSharp code in.'
complete -c abp -n "__fish_seen_subcommand_from generate-proxy" -s o -l output -r -d 'JavaScript file path or folder to place generated code in.'
complete -c abp -n "__fish_seen_subcommand_from generate-proxy" -s a -l api-name -r -d '(default: \'default\') The name of the API endpoint defined in the /src/envir...'
complete -c abp -n "__fish_seen_subcommand_from generate-proxy" -s s -l source -r -d '(default: \'defaultProject\') Angular project name to resolve the root namesp...'
complete -c abp -n "__fish_seen_subcommand_from generate-proxy" -s p -l prompt -d 'Asks the options from the command line prompt (for the missing options)'
complete -c abp -n "__fish_seen_subcommand_from generate-proxy" -l target -r -d '(default: \'defaultProject\') Angular project name to place generated code in.'

# get-source
complete -c abp -n "__fish_seen_subcommand_from get-source" -s o -l output-folder -r -d 'default: current folder'
complete -c abp -n "__fish_seen_subcommand_from get-source" -s v -l version -r -d 'default: latest version'
complete -c abp -n "__fish_seen_subcommand_from get-source" -l preview -d 'Use latest pre-release version if there is at least one pre-release after lat...'

# index-docs
complete -c abp -n "__fish_seen_subcommand_from index-docs" -s s -l source -d 'Path to the documentation folder (required)'
complete -c abp -n "__fish_seen_subcommand_from index-docs" -s o -l output -d 'Output folder for the index database (required)'
complete -c abp -n "__fish_seen_subcommand_from index-docs" -s k -l api-key -d 'API key for embedding and summarization (required)'
complete -c abp -n "__fish_seen_subcommand_from index-docs" -s m -l embedding-model -d 'Embedding model name (default: text-embedding-3-small)'
complete -c abp -n "__fish_seen_subcommand_from index-docs" -s u -l embedding-base-url -d 'Embedding API base URL (default: OpenAI endpoint)'
complete -c abp -n "__fish_seen_subcommand_from index-docs" -l summarization-model -d 'Summarization model name (default: anthropic/claude-haiku-4.5)'
complete -c abp -n "__fish_seen_subcommand_from index-docs" -l export-summaries -d 'Export document summaries to disk as .md files'
complete -c abp -n "__fish_seen_subcommand_from index-docs" -l no-rag -d 'Only summarize, skip RAG indexing (implies --export-summaries)'

# init-solution
complete -c abp -n "__fish_seen_subcommand_from init-solution" -s n -l name

# install-libs
complete -c abp -n "__fish_seen_subcommand_from install-libs" -s wd -l working-directory -r -d 'default: empty'

# login
complete -c abp -n "__fish_seen_subcommand_from login" -l device
complete -c abp -n "__fish_seen_subcommand_from login" -l password

# mcp-studio
complete -c abp -n "__fish_seen_subcommand_from mcp-studio" -s e -l endpoint -r -d 'ABP Studio MCP server endpoint (default: http://localhost:38280/mcp/)'

# new
complete -c abp -n "__fish_seen_subcommand_from new" -s t -l template -r -d 'Solution template to use (default: app)'
complete -c abp -n "__fish_seen_subcommand_from new" -l modern -d 'Use the modern variant of the template'
complete -c abp -n "__fish_seen_subcommand_from new" -s u -l ui-framework -r -d 'UI framework to generate'
complete -c abp -n "__fish_seen_subcommand_from new" -s m -l mobile -r -d 'Mobile application framework'
complete -c abp -n "__fish_seen_subcommand_from new" -s d -l database-provider -r -d 'Database provider to configure'
complete -c abp -n "__fish_seen_subcommand_from new" -s cs -l connection-string -r -d 'Override generated connection strings'
complete -c abp -n "__fish_seen_subcommand_from new" -s o -l output-folder -r -d 'Output folder (default: current directory)'
complete -c abp -n "__fish_seen_subcommand_from new" -s csf -l create-solution-folder -d 'Create a folder for the solution'
complete -c abp -n "__fish_seen_subcommand_from new" -s dbms -l database-management-system -d 'Database management system to use'
complete -c abp -n "__fish_seen_subcommand_from new" -l tiered -d 'Create a tiered solution when supported'
complete -c abp -n "__fish_seen_subcommand_from new" -s pwa -l progressive-web-app -d 'Enable Progressive Web App support'
complete -c abp -n "__fish_seen_subcommand_from new" -s sm -l skip-migrations -d 'Skip the initial database migration'
complete -c abp -n "__fish_seen_subcommand_from new" -s smr -l skip-migrator -d 'Skip the database migrator step'
complete -c abp -n "__fish_seen_subcommand_from new" -s ntp -l no-tests -d 'Skip test project generation'
complete -c abp -n "__fish_seen_subcommand_from new" -s th -l theme -r -d 'Theme to use'
complete -c abp -n "__fish_seen_subcommand_from new" -s uost -l use-open-source-template -d 'Use the open-source template'
complete -c abp -n "__fish_seen_subcommand_from new" -s lfr -l local-framework-ref -d 'Use local ABP framework references'
complete -c abp -n "__fish_seen_subcommand_from new" -l abp-path -r -d 'Local ABP framework repository path'
complete -c abp -n "__fish_seen_subcommand_from new" -l volo-path -r -d 'Local ABP commercial repository path'
complete -c abp -n "__fish_seen_subcommand_from new" -l studio-path -r -d 'Local ABP Studio repository path'
complete -c abp -n "__fish_seen_subcommand_from new" -s nkc -l no-kubernetes-configuration -d 'Skip Kubernetes configuration files'
complete -c abp -n "__fish_seen_subcommand_from new" -s nsl -l no-social-logins -d 'Skip social login configuration'
complete -c abp -n "__fish_seen_subcommand_from new" -l public-website -d 'Add a public website'
complete -c abp -n "__fish_seen_subcommand_from new" -l without-cms-kit -d 'Exclude CmsKit from the public website'
complete -c abp -n "__fish_seen_subcommand_from new" -s scp -l sample-crud-page -d 'Add the BookStore sample page'
complete -c abp -n "__fish_seen_subcommand_from new" -l separate-tenant-schema -d 'Use a separate tenant schema'
complete -c abp -n "__fish_seen_subcommand_from new" -l no-multi-tenancy -d 'Disable multi-tenancy'
complete -c abp -n "__fish_seen_subcommand_from new" -l dont-run-install-libs -d 'Skip client-side package installation'
complete -c abp -n "__fish_seen_subcommand_from new" -l dont-run-bundling -d 'Skip Blazor bundling'
complete -c abp -n "__fish_seen_subcommand_from new" -l classic -d 'Generate a classic solution'
complete -c abp -n "__fish_seen_subcommand_from new" -l trust-version -d 'Skip template version validation'

# new-module
complete -c abp -n "__fish_seen_subcommand_from new-module" -s t -l template -r -d 'Module template to use (default: ddd)'
complete -c abp -n "__fish_seen_subcommand_from new-module" -l modern -d 'Use the modern variant of the module template'
complete -c abp -n "__fish_seen_subcommand_from new-module" -s ts -l target-solution -r -d 'Path to the target .abpsln file'
complete -c abp -n "__fish_seen_subcommand_from new-module" -s o -l output-folder -r -d 'Output folder (default: current directory)'
complete -c abp -n "__fish_seen_subcommand_from new-module" -s csf -l create-solution-folder -d 'Create a folder for the module'
complete -c abp -n "__fish_seen_subcommand_from new-module" -s sf -l solution-folder -r -d 'Solution folder inside the .abpsln'
complete -c abp -n "__fish_seen_subcommand_from new-module" -s u -l ui-framework -r -d 'UI framework(s) to generate (comma-separated)'
complete -c abp -n "__fish_seen_subcommand_from new-module" -s d -l database-provider -r -d 'Database provider(s) (comma-separated)'
complete -c abp -n "__fish_seen_subcommand_from new-module" -s ntp -l no-tests -d 'Skip test project generation'
complete -c abp -n "__fish_seen_subcommand_from new-module" -s lfr -l local-framework-ref -d 'Use local ABP framework references'
complete -c abp -n "__fish_seen_subcommand_from new-module" -l abp-path -r -d 'Local ABP framework repository path'
complete -c abp -n "__fish_seen_subcommand_from new-module" -l volo-path -r -d 'Local ABP commercial repository path'
complete -c abp -n "__fish_seen_subcommand_from new-module" -l studio-path -r -d 'Local ABP Studio repository path'

# remove-proxy
complete -c abp -n "__fish_seen_subcommand_from remove-proxy" -s m -l module -r -d '(default: \'app\') The name of the backend module you wish to generate proxie...'
complete -c abp -n "__fish_seen_subcommand_from remove-proxy" -s wd -l working-directory -r -d 'Execution directory.'
complete -c abp -n "__fish_seen_subcommand_from remove-proxy" -s u -l url -r -d 'API definition URL from.'
complete -c abp -n "__fish_seen_subcommand_from remove-proxy" -s t -l type -r -d 'The name of generate type (csharp, js, ng).'
complete -c abp -n "__fish_seen_subcommand_from remove-proxy" -l without-contracts -d 'Avoid generating the application service interface, class, enum and dto types.'
complete -c abp -n "__fish_seen_subcommand_from remove-proxy" -l folder -r -d '(default: \'ClientProxies\') Folder name to place generated CSharp code in.'
complete -c abp -n "__fish_seen_subcommand_from remove-proxy" -s o -l output -r -d 'JavaScript file path or folder to place generated code in.'
complete -c abp -n "__fish_seen_subcommand_from remove-proxy" -s a -l api-name -r -d '(default: \'default\') The name of the API endpoint defined in the /src/envir...'
complete -c abp -n "__fish_seen_subcommand_from remove-proxy" -s s -l source -r -d '(default: \'defaultProject\') Angular project name to resolve the root namesp...'
complete -c abp -n "__fish_seen_subcommand_from remove-proxy" -s p -l prompt -d 'Asks the options from the command line prompt (for the missing options)'
complete -c abp -n "__fish_seen_subcommand_from remove-proxy" -l target -r -d '(default: \'defaultProject\') Angular project name to place generated code in.'

# run
complete -c abp -n "__fish_seen_subcommand_from run" -s p -l profile -d 'Profile name to run. Uses defaultRunProfile if not specified.'
complete -c abp -n "__fish_seen_subcommand_from run" -l no-build -d 'Skip building applications before running.'
complete -c abp -n "__fish_seen_subcommand_from run" -s wd -l working-directory -d 'Working directory containing the .abpsln file. Defaults to current directory.'

# switch-to-local
complete -c abp -n "__fish_seen_subcommand_from switch-to-local" -s s -l solution -r -d 'default: current directory'
complete -c abp -n "__fish_seen_subcommand_from switch-to-local" -s p -l paths -r -d 'Required'

# switch-to-nightly
complete -c abp -n "__fish_seen_subcommand_from switch-to-nightly" -s d -l directory

# switch-to-prerc
complete -c abp -n "__fish_seen_subcommand_from switch-to-prerc" -s d -l directory

# switch-to-preview
complete -c abp -n "__fish_seen_subcommand_from switch-to-preview" -s d -l directory

# switch-to-stable
complete -c abp -n "__fish_seen_subcommand_from switch-to-stable" -s d -l directory

# translate
complete -c abp -n "__fish_seen_subcommand_from translate" -l online -d 'Translate online.'
complete -c abp -n "__fish_seen_subcommand_from translate" -l deepl-auth-key -r -d 'DeepL auth key for online translation.'
complete -c abp -n "__fish_seen_subcommand_from translate" -l verify -d 'Verify that all localized files are correct JSON format.'

# update
complete -c abp -n "__fish_seen_subcommand_from update" -s p -l include-previews -d 'if supported by the template'
complete -c abp -n "__fish_seen_subcommand_from update" -l npm -d 'Only updates NPM packages'
complete -c abp -n "__fish_seen_subcommand_from update" -l nuget -d 'Only updates Nuget packages'
complete -c abp -n "__fish_seen_subcommand_from update" -s sp -l solution-path -d 'Specify the solution path'
complete -c abp -n "__fish_seen_subcommand_from update" -s sn -l solution-name -d 'Specify the solution name'
complete -c abp -n "__fish_seen_subcommand_from update" -l check-all -d 'Check the new version of each package separately'
complete -c abp -n "__fish_seen_subcommand_from update" -s v -l version -r -d 'default: latest version'
complete -c abp -n "__fish_seen_subcommand_from update" -s lv -l leptonx-version -r -d 'default: latest LeptonX version'

# watch
complete -c abp -n "__fish_seen_subcommand_from watch" -s p -l profile -d 'Profile name to run. Uses defaultRunProfile if not specified.'
complete -c abp -n "__fish_seen_subcommand_from watch" -s wd -l working-directory -d 'Working directory containing the .abpsln file. Defaults to current directory.'

