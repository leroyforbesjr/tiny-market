
;; SIP010-token
;; the code for my generic SIP010 token, "Meh"


(impl-trait .sip010-ft-trait.sip010-ft-trait)

;; SIP010 trait on mainnet
;; (impl-trait 'SP3FBR2AGK5H9QBDH3EEN6DF8EK8JY7RX8QJ5SVTE.sip-010-trait-ft-standard.sip-010-trait)

(define-constant contract-owner tx-sender)

(define-constant err-owner-only (err u100))
(define-constant err-not-token-owner (err u101))

(define-fungible-token sip010-token u100000000)

(define-public (transfer (amount uint) (sender principal) (recipient principal) (memo (optional (buff 34))))
	(begin
		(asserts! (is-eq tx-sender sender) err-owner-only)
		(ft-transfer? sip010-token amount sender recipient)
	)
)

(define-read-only (get-name)
	(ok "Meh SIP010 Token")
)

(define-read-only (get-symbol)
	(ok "MEH")
)

(define-read-only (get-decimals)
	(ok u6)
)

(define-read-only (get-balance (who principal))
	(ok (ft-get-balance sip010-token who))
)

(define-read-only (get-total-supply)
	(ok (ft-get-supply sip010-token))
)

(define-read-only (get-token-uri)
	(ok none)
)

(define-public (mint (amount uint) (recipient principal))
	(begin
		(asserts! (is-eq tx-sender contract-owner) err-owner-only)
		(ft-mint? sip010-token amount recipient)
	)
)
