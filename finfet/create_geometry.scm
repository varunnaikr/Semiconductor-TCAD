; Simple 2D MOSFET structure for hot-carrier study
; Define regions and materials

; Silicon substrate (channel region)
(sdegeo:create-rectangular-region (position 0.0 0.0 0.0) (position 1.0 -1.0 0.0) "Silicon" "Reg.Si")

; Gate oxide
(sdegeo:create-rectangular-region (position 0.2 0.0 0.0) (position 0.8 0.02 0.0) "SiO2" "Reg.Oxide")

; Polysilicon gate
(sdegeo:create-rectangular-region (position 0.2 0.02 0.0) (position 0.8 0.15 0.0) "PolySi" "Reg.Gate")

; Source region (heavily doped n-type)
(sdegeo:create-rectangular-region (position 0.0 0.0 0.0) (position 0.2 0.2 0.0) "Silicon" "Reg.Source")

; Drain region (heavily doped n-type)  
(sdegeo:create-rectangular-region (position 0.8 0.0 0.0) (position 1.0 0.2 0.0) "Silicon" "Reg.Drain")

; Substrate contact
(sdegeo:create-rectangular-region (position 0.0 -0.95 0.0) (position 1.0 -1.0 0.0) "Silicon" "Reg.Bulk")

; Define contact edges
(sdegeo:define-contact (find-edge-id (position 0.1 0.1 0.0)) "source")
(sdegeo:define-contact (find-edge-id (position 0.9 0.1 0.0)) "drain")
(sdegeo:define-contact (find-edge-id (position 0.5 0.1 0.0)) "gate")
(sdegeo:define-contact (find-edge-id (position 0.5 -0.975 0.0)) "substrate")

; Define refinement window for channel
(sdegeo:define-refinement-window "channel" "Cuboid" (position 0.2 -0.1 0.0) (position 0.8 0.05 0.0))
(sdegeo:set-refinement-window "channel" "MaxElementSize" 0.01)

; Save the structure
(sdegeo:save-model "mosfet1_des")