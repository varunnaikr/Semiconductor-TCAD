A(sde:clear)

(define fin_height 0.04)
(define fin_width 0.015)
(define fin_length 0.15)
(define gate_length 0.032)
(define tox 0.001)
(define gate_metal_t 0.01)
(define box_thickness 0.015)
(define substrate_h 0.05)

(define sd_ext (/ (- fin_length gate_length) 2.0))
(define gate_x_start sd_ext)
(define gate_x_end (+ gate_x_start gate_length))

(define z_gate_metal_start 0)
(define z_gate_ox_start gate_metal_t)
(define z_fin_start (+ gate_metal_t tox))
(define z_fin_end (+ z_fin_start fin_width))
(define z_gate_ox_end (+ z_fin_end tox))
(define z_gate_metal_end (+ z_gate_ox_end gate_metal_t))

(define y_substrate_bottom (- substrate_h))
(define y_substrate_top 0)
(define y_box_top box_thickness)
(define y_fin_top (+ y_box_top fin_height))

(sdegeo:create-cuboid 
  (position 0 y_substrate_bottom z_gate_metal_start) 
  (position fin_length y_substrate_top z_gate_metal_end) 
  "Silicon" "substrate")

(sdegeo:create-cuboid 
  (position 0 y_substrate_top z_gate_metal_start) 
  (position fin_length y_box_top z_gate_metal_end) 
  "SiO2" "buried_oxide")

(sdegeo:create-cuboid 
  (position 0 y_box_top z_fin_start) 
  (position fin_length y_fin_top z_fin_end) 
  "Silicon" "fin_base")

(sdegeo:create-cuboid 
  (position 0 y_box_top z_fin_start) 
  (position sd_ext y_fin_top z_fin_end) 
  "Silicon" "source")

(sdegeo:create-cuboid 
  (position gate_x_end y_box_top z_fin_start) 
  (position fin_length y_fin_top z_fin_end) 
  "Silicon" "drain")

(sdegeo:create-cuboid 
  (position gate_x_start y_box_top z_gate_ox_start) 
  (position gate_x_end y_fin_top z_fin_start) 
  "SiO2" "gate_oxide_bottom")

(sdegeo:create-cuboid 
  (position gate_x_start y_box_top z_fin_end) 
  (position gate_x_end y_fin_top z_gate_ox_end) 
  "SiO2" "gate_oxide_top")

(sdegeo:create-cuboid 
  (position gate_x_start y_box_top z_gate_metal_start) 
  (position gate_x_end y_fin_top z_gate_ox_start) 
  "Aluminum" "gate_metal_bottom")

(sdegeo:create-cuboid 
  (position gate_x_start y_box_top z_gate_ox_end) 
  (position gate_x_end y_fin_top z_gate_metal_end) 
  "Aluminum" "gate_metal_top")

(sdedr:define-constant-profile "ConstantProfileDefinition_substrate" 
  "BoronActiveConcentration" 1e15)
(sdedr:define-constant-profile-region "ConstantProfilePlacement_substrate" 
  "ConstantProfileDefinition_substrate" "substrate")

(sdedr:define-constant-profile "ConstantProfileDefinition_channel" 
  "BoronActiveConcentration" 1e16)
(sdedr:define-constant-profile-region "ConstantProfilePlacement_channel" 
  "ConstantProfileDefinition_channel" "fin_base")

(sdedr:define-constant-profile "ConstantProfileDefinition_source" 
  "ArsenicActiveConcentration" 1e20)
(sdedr:define-constant-profile-region "ConstantProfilePlacement_source" 
  "ConstantProfileDefinition_source" "source")

(sdedr:define-constant-profile "ConstantProfileDefinition_drain" 
  "ArsenicActiveConcentration" 1e20)
(sdedr:define-constant-profile-region "ConstantProfilePlacement_drain" 
  "ConstantProfileDefinition_drain" "drain")

(sdedr:define-refinement-size "RefinementDefinition_channel" 
  0.005 0.002 0.003 0.002 0.001 0.001)
(sdedr:define-refinement-placement "RefinementPlacement_channel" 
  "RefinementDefinition_channel" (list "region" "fin_base"))

(sdedr:define-refinement-size "RefinementDefinition_source" 
  0.005 0.003 0.003 0.002 0.001 0.001)
(sdedr:define-refinement-placement "RefinementPlacement_source" 
  "RefinementDefinition_source" (list "region" "source"))

(sdedr:define-refinement-size "RefinementDefinition_drain" 
  0.005 0.003 0.003 0.002 0.001 0.001)
(sdedr:define-refinement-placement "RefinementPlacement_drain" 
  "RefinementDefinition_drain" (list "region" "drain"))

(sdedr:define-refinement-size "RefinementDefinition_oxide" 
  0.005 0.002 0.0005 0.002 0.001 0.0002)
(sdedr:define-refinement-placement "RefinementPlacement_oxide_bottom" 
  "RefinementDefinition_oxide" (list "region" "gate_oxide_bottom"))
(sdedr:define-refinement-placement "RefinementPlacement_oxide_top" 
  "RefinementDefinition_oxide" (list "region" "gate_oxide_top"))

(sdedr:define-refinement-size "RefinementDefinition_bulk" 
  0.01 0.01 0.01 0.005 0.005 0.005)
(sdedr:define-refinement-placement "RefinementPlacement_substrate" 
  "RefinementDefinition_bulk" (list "region" "substrate"))
(sdedr:define-refinement-placement "RefinementPlacement_box" 
  "RefinementDefinition_bulk" (list "region" "buried_oxide"))

(sdegeo:define-contact-set "source" 4 (color:rgb 1 0 0) "##")
(sdegeo:set-current-contact-set "source")
(sdegeo:define-2d-contact (find-face-id (position 0.01 (+ y_box_top 0.02) (/ (+ z_fin_start z_fin_end) 2.0))) "source")

(sdegeo:define-contact-set "drain" 4 (color:rgb 1 1 1) "==")
(sdegeo:set-current-contact-set "drain")
(sdegeo:define-2d-contact (find-face-id (position 0.14 (+ y_box_top 0.02) (/ (+ z_fin_start z_fin_end) 2.0))) "drain")

(sdegeo:define-contact-set "gate" 4 (color:rgb 1 0 1) "||")
(sdegeo:set-current-contact-set "gate")
(sdegeo:define-2d-contact (find-face-id (position (/ fin_length 2) (+ y_box_top 0.02) z_gate_metal_end)) "gate")

(sdegeo:define-contact-set "subs" 4 (color:rgb 1 1 0) "//")
(sdegeo:set-current-contact-set "subs")
(sdegeo:define-2d-contact (find-face-id (position (/ fin_length 2) y_substrate_bottom (/ z_gate_metal_end 2.0))) "subs")

(sdeio:save-tdr-bnd (get-body-list) "finfet_hci")
(sde:build-mesh "snmesh" "" "finfet_hci")