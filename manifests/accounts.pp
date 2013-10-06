class common::accounts (
  $records  = 'accounts',
  $defaults = 'account_defaults'
) {
  $accounts         = hiera_hash($records, {})
  $account_defaults = hiera_hash($defaults, {})
  create_resources('account', $accounts, $account_defaults)
}
