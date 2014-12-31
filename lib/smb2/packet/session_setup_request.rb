require 'smb2/packet'

class Smb2::Packet

  class SessionSetupRequest < Smb2::Packet
    nest :header, RequestHeader
    unsigned :struct_size,          16, endian: 'little'
    unsigned :flags,                 8, default: 0x00
    unsigned :security_mode,         8
    unsigned :capabilities,         32, endian: 'little'
    unsigned :channel,              32, endian: 'little', default: 0

    data_buffer :security_blob

    unsigned :previous_session_id,  64, endian: 'little'

    FLAGS = {
      SESSION_BINDING_REQUEST: 0x0000_0001
    }.freeze

    FLAG_NAMES = FLAGS.keys

  end

end
