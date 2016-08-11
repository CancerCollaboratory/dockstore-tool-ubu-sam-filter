#!/usr/bin/env cwl-runner

class: CommandLineTool

dct:creator:
  foaf:name: Andy Yang
  foaf:mbox: mailto:ayang@oicr.on.ca
cwlVersion: v1.0

requirements:
- class: DockerRequirement
  dockerPull: quay.io/cancercollaboratory/dockstore-tool-ubu-sam-filter
inputs:
  out:
    type: string
    inputBinding:
      position: 2
      prefix: --out
    doc: Required output sam or bam file
  in:
    type: File
    inputBinding:
      position: 1
      prefix: --in
    doc: Required input sam or bam file
outputs:
  out:
    type: File
    outputBinding:
      glob: $(inputs.out)

    doc: Required output sam or bam file
baseCommand: [java, -jar, /opt/ubu/ubu.jar, sam-filter]
doc: |
  Filter reads from a paired end SAM or BAM file (only outputs paired reads)

