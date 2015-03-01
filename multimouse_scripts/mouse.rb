require 'libusb'
require 'usb'  # this is the ruby-usb gem

USB.devices.map{|x| puts x }
@d = USB.devices.last # note, I am sure that this is the correct device
i = @d.interfaces.last
e = i.endpoints.last

buffer = " " * 64

begin
  h = @d.open
  h.usb_detach_kernel_driver_np(0,0) rescue nil
  # h.usb_claim_interface(0)
end

y= 0
while true
  # puts h
  # system("cliclick m:200,#{y}")
  # y += 1
end

#
# usb = LIBUSB::Context.new
# device = usb.devices(:idVendor => 0x1532, :idProduct => 0x000c).first
# device.open do |handle|
#   data = ' ' * 64
#   puts handle.string_descriptor_ascii(1)
#   puts handle.
#
# end

# puts h.usb_bulk_read(e, e, e)

# #
# class MultiMouse
#   def start
#     begin
#         puts @usb = LIBUSB::Context.new.devices(
#          :idVendor  => 0x1532,
#          :idProduct => 0x000c
#        ).first.open
#       #  @usb.bulk_transfer{:endpoint=> }
#       #  @usb.bulk_transfer
#      rescue LIBUSB::ERROR_ACCESS
#        abort("No permission to access USB device!")
#      rescue LIBUSB::ERROR_BUSY
#        abort("The USB device is busy!")
#      rescue NoMethodError
#        abort("Could not find USB device!")
#      end
#    end
#
#
#  end
#
#  mm = MultiMouse.new
#  mm.start
