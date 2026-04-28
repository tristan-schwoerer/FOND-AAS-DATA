(define (domain merged_ai_planning-domain)
 (:requirements :strips :typing :negative-preconditions :non-deterministic)
 (:types
    thing - object
    product resource resourceparameter step - thing
    spatialparameter - resourceparameter
    locationparameter - spatialparameter
    cps imadispensingsystemaas syntegonstopperingsystemaas imaloadingsystemaas optimaunloadingsystemaas omroncamerasystemaas cytivacappingsystemaas - resource
    transport - cps
    planartableshuttle1aas planartableshuttle2aas planartableshuttle3aas - transport
    mim8_0001aas mim8_0002aas - product
 )
 (:constants
   planarshuttle1 - planartableshuttle1aas
   planarshuttle2 - planartableshuttle2aas
   planarshuttle3 - planartableshuttle3aas
   imadispensingsystem - imadispensingsystemaas
   loadinglocation stopperinglocation cappinglocation capturelocation dispensinglocation unloadinglocation - locationparameter
   step_2_stoppering step_1_dispensing step_3_inspection - step
   syntegonstopperingsystem - syntegonstopperingsystemaas
   imaloadingsystem - imaloadingsystemaas
   optimaunloadingsystem - optimaunloadingsystemaas
   omroncamerasystem - omroncamerasystemaas
   cytivacappingsystem - cytivacappingsystemaas
 )
 (:predicates 
             (finished ?p0 - product)
             (operational ?p0_0 - resource)
             (occupied ?p0_0 - resource ?p1 - product)
             (free ?p0_0 - resource)
             (empty ?p0_1 - transport)
             (resourceat ?p0_0 - resource ?p1_0 - locationparameter)
             (stationat ?p0_0 - resource ?p1_0 - locationparameter)
             (on ?p0 - product ?p1_1 - transport)
             (productat ?p0 - product ?p1_0 - locationparameter)
             (dispensed ?p0 - product)
             (stoppered ?p0 - product)
             (captured ?p0 - product)
             (qualityok ?p0 - product)
             (step_ready ?p0 - product ?p1_2 - step)
             (step_done ?p0 - product ?p1_2 - step)
             (capped ?p0_2 - thing)
 )
 (:action movetoposition
  :parameters ( ?p0_1 - transport ?p1_0 - locationparameter ?p2 - locationparameter)
  :precondition (and (operational ?p0_1) (free ?p0_1) (resourceat ?p0_1 ?p1_0))
  :effect (and (not (resourceat ?p0_1 ?p1_0)) (resourceat ?p0_1 ?p2)))
 (:action movetoposition_2
  :parameters ( ?p0_1 - transport ?p1 - product ?p2 - locationparameter ?p3 - locationparameter ?p4 - resource)
  :precondition (and (operational ?p0_1) (occupied ?p0_1 ?p1) (on ?p1 ?p0_1) (productat ?p1 ?p2) (resourceat ?p0_1 ?p2) (occupied ?p4 ?p1) (stationat ?p4 ?p3))
  :effect (and (not (resourceat ?p0_1 ?p2)) (not (productat ?p1 ?p2)) (resourceat ?p0_1 ?p3) (productat ?p1 ?p3)))
 (:action occupy
  :parameters ( ?p0 - product)
  :precondition (and (not (occupied planarshuttle1 ?p0)) (free planarshuttle1))
  :effect (and (occupied planarshuttle1 ?p0) (not (free planarshuttle1))))
 (:action release
  :parameters ( ?p0 - product)
  :precondition (and (operational planarshuttle1) (occupied planarshuttle1 ?p0))
  :effect (and (not (occupied planarshuttle1 ?p0)) (free planarshuttle1)))
 (:action occupy_2
  :parameters ( ?p0 - product)
  :precondition (and (not (occupied planarshuttle2 ?p0)) (free planarshuttle2))
  :effect (and (occupied planarshuttle2 ?p0) (not (free planarshuttle2))))
 (:action release_2
  :parameters ( ?p0 - product)
  :precondition (and (operational planarshuttle2) (occupied planarshuttle2 ?p0))
  :effect (and (not (occupied planarshuttle2 ?p0)) (free planarshuttle2)))
 (:action occupy_3
  :parameters ( ?p0 - product)
  :precondition (and (not (occupied planarshuttle3 ?p0)) (free planarshuttle3))
  :effect (and (occupied planarshuttle3 ?p0) (not (free planarshuttle3))))
 (:action release_3
  :parameters ( ?p0 - product)
  :precondition (and (operational planarshuttle3) (occupied planarshuttle3 ?p0))
  :effect (and (not (occupied planarshuttle3 ?p0)) (free planarshuttle3)))
 (:action dispensing
  :parameters ( ?p0 - product ?p1_1 - transport)
  :precondition (and (operational imadispensingsystem) (occupied imadispensingsystem ?p0) (on ?p0 ?p1_1) (productat ?p0 dispensinglocation) (step_ready ?p0 step_1_dispensing) (not (step_done ?p0 step_1_dispensing)))
  :effect (and (dispensed ?p0) (step_done ?p0 step_1_dispensing) (not (step_ready ?p0 step_1_dispensing)) (step_ready ?p0 step_2_stoppering)))
 (:action occupy_4
  :parameters ( ?p0 - product)
  :precondition (and (not (occupied imadispensingsystem ?p0)) (free imadispensingsystem) (step_ready ?p0 step_1_dispensing))
  :effect (and (occupied imadispensingsystem ?p0) (not (free imadispensingsystem))))
 (:action release_4
  :parameters ( ?p0 - product)
  :precondition (and (operational imadispensingsystem) (occupied imadispensingsystem ?p0))
  :effect (and (not (occupied imadispensingsystem ?p0)) (free imadispensingsystem)))
 (:action stoppering
  :parameters ( ?p0 - product ?p1_1 - transport)
  :precondition (and (operational syntegonstopperingsystem) (occupied syntegonstopperingsystem ?p0) (on ?p0 ?p1_1) (productat ?p0 stopperinglocation) (step_ready ?p0 step_2_stoppering) (not (step_done ?p0 step_2_stoppering)))
  :effect (and (stoppered ?p0) (step_done ?p0 step_2_stoppering) (not (step_ready ?p0 step_2_stoppering)) (step_ready ?p0 step_3_inspection)))
 (:action occupy_5
  :parameters ( ?p0 - product)
  :precondition (and (not (occupied syntegonstopperingsystem ?p0)) (free syntegonstopperingsystem) (step_ready ?p0 step_2_stoppering))
  :effect (and (occupied syntegonstopperingsystem ?p0) (not (free syntegonstopperingsystem))))
 (:action release_5
  :parameters ( ?p0 - product)
  :precondition (and (operational syntegonstopperingsystem) (occupied syntegonstopperingsystem ?p0))
  :effect (and (not (occupied syntegonstopperingsystem ?p0)) (free syntegonstopperingsystem)))
 (:action loading
  :parameters ( ?p0 - product ?p1_1 - transport)
  :precondition (and (operational imaloadingsystem) (occupied imaloadingsystem ?p0) (resourceat ?p1_1 loadinglocation) (empty ?p1_1))
  :effect (and (oneof (and (on ?p0 ?p1_1) (productat ?p0 loadinglocation) (not (empty ?p1_1))) (not (on ?p0 ?p1_1)))))
 (:action occupy_6
  :parameters ( ?p0 - product)
  :precondition (and (not (occupied imaloadingsystem ?p0)) (free imaloadingsystem))
  :effect (and (occupied imaloadingsystem ?p0) (not (free imaloadingsystem))))
 (:action release_6
  :parameters ( ?p0 - product)
  :precondition (and (operational imaloadingsystem) (occupied imaloadingsystem ?p0))
  :effect (and (not (occupied imaloadingsystem ?p0)) (free imaloadingsystem)))
 (:action unloading
  :parameters ( ?p0 - product ?p1_1 - transport)
  :precondition (and (operational optimaunloadingsystem) (occupied optimaunloadingsystem ?p0) (on ?p0 ?p1_1) (productat ?p0 unloadinglocation) (qualityok ?p0))
  :effect (and (not (on ?p0 ?p1_1)) (empty ?p1_1) (finished ?p0)))
 (:action scrap
  :parameters ( ?p0 - product ?p1_1 - transport)
  :precondition (and (operational optimaunloadingsystem) (occupied optimaunloadingsystem ?p0) (on ?p0 ?p1_1) (productat ?p0 unloadinglocation) (not (qualityok ?p0)))
  :effect (and (not (on ?p0 ?p1_1)) (empty ?p1_1) (finished ?p0)))
 (:action occupy_7
  :parameters ( ?p0 - product)
  :precondition (and (not (occupied optimaunloadingsystem ?p0)) (free optimaunloadingsystem))
  :effect (and (occupied optimaunloadingsystem ?p0) (not (free optimaunloadingsystem))))
 (:action release_7
  :parameters ( ?p0 - product)
  :precondition (and (operational optimaunloadingsystem) (occupied optimaunloadingsystem ?p0))
  :effect (and (not (occupied optimaunloadingsystem ?p0)) (free optimaunloadingsystem)))
 (:action capture
  :parameters ( ?p0 - product ?p1_1 - transport)
  :precondition (and (operational omroncamerasystem) (occupied omroncamerasystem ?p0) (on ?p0 ?p1_1) (productat ?p0 capturelocation) (step_ready ?p0 step_3_inspection) (not (step_done ?p0 step_3_inspection)))
  :effect (and (captured ?p0) (step_done ?p0 step_3_inspection) (not (step_ready ?p0 step_3_inspection)) (oneof (qualityok ?p0) (not (qualityok ?p0)))))
 (:action occupy_8
  :parameters ( ?p0 - product)
  :precondition (and (not (occupied omroncamerasystem ?p0)) (free omroncamerasystem) (step_ready ?p0 step_3_inspection))
  :effect (and (occupied omroncamerasystem ?p0) (not (free omroncamerasystem))))
 (:action release_8
  :parameters ( ?p0 - product)
  :precondition (and (operational omroncamerasystem) (occupied omroncamerasystem ?p0))
  :effect (and (not (occupied omroncamerasystem ?p0)) (free omroncamerasystem)))
 (:action capping
  :parameters ( ?p0 - product)
  :precondition (and (operational cytivacappingsystem) (occupied cytivacappingsystem ?p0) (productat ?p0 cappinglocation))
  :effect (and (capped ?p0)))
 (:action occupy_9
  :parameters ( ?p0 - product)
  :precondition (and (not (occupied cytivacappingsystem ?p0)) (free cytivacappingsystem))
  :effect (and (occupied cytivacappingsystem ?p0) (not (free cytivacappingsystem))))
 (:action release_9
  :parameters ( ?p0 - product)
  :precondition (and (operational cytivacappingsystem) (occupied cytivacappingsystem ?p0))
  :effect (and (not (occupied cytivacappingsystem ?p0)) (free cytivacappingsystem)))
)
