#!/usr/bin/env cwl-runner

class: CommandLineTool

description: |
  Filter reads from a paired end SAM or BAM file (only outputs paired reads)

dct:creator:
  foaf:name: Andy Yang
  foaf:mbox: "mailto:ayang@oicr.on.ca"

cwlVersion: draft-3

requirements:
  - class: DockerRequirement
    dockerPull: "quay.io/cancercollaboratory/dockstore-tool-ubu-sam-filter"

inputs:
  - id: "#in"
    type: File
    description: "Required input sam or bam file"
    inputBinding:
      position: 1
      prefix: "--in"

  - id: "#out"
    type: string 
    description: "Required output sam or bam file"
    inputBinding:
      position:  2
      prefix: "--out"

outputs:
  - id: "#out"
    type: File
    description: "Required output sam or bam file"
    outputBinding:
      glob: $(inputs.out)

baseCommand: ["java" , "-jar" , "/opt/ubu/ubu.jar" , "sam-filter"]
