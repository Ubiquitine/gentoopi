/* gstreamer-netbuffer-0.10.vapi generated by vapigen, do not modify. */

[CCode (cprefix = "Gst", lower_case_cprefix = "gst_")]
namespace Gst {
	[CCode (cheader_filename = "gst/netbuffer/gstnetbuffer.h")]
	public class NetBuffer : Gst.Buffer {
		public weak Gst.Buffer buffer;
		public Gst.NetAddress from;
		public Gst.NetAddress to;
		[CCode (cname = "gst_netbuffer_new", has_construct_function = false)]
		public NetBuffer ();
	}
	[CCode (cheader_filename = "gst/netbuffer/gstnetbuffer.h")]
	public struct NetAddress {
		public Gst.NetType type;
		public void* address;
		public uint16 port;
		[CCode (cname = "gst_netaddress_equal")]
		public bool equal (Gst.NetAddress naddr2);
		[CCode (cname = "gst_netaddress_get_address_bytes")]
		public int get_address_bytes ([CCode (array_length = false)] uchar[] address, out uint16 port);
		[CCode (cname = "gst_netaddress_get_ip4_address")]
		public bool get_ip4_address (out uint32 address, out uint16 port);
		[CCode (cname = "gst_netaddress_get_ip6_address")]
		public bool get_ip6_address ([CCode (array_length = false)] uchar[] address, out uint16 port);
		[CCode (cname = "gst_netaddress_get_net_type")]
		public Gst.NetType get_net_type ();
		[CCode (cname = "gst_netaddress_set_address_bytes")]
		public int set_address_bytes (Gst.NetType type, [CCode (array_length = false)] uchar[] address, uint16 port);
		[CCode (cname = "gst_netaddress_set_ip4_address")]
		public void set_ip4_address (uint32 address, uint16 port);
		[CCode (cname = "gst_netaddress_set_ip6_address")]
		public void set_ip6_address ([CCode (array_length = false)] uchar[] address, uint16 port);
		[CCode (cname = "gst_netaddress_to_string")]
		public int to_string (string dest, ulong len);
	}
	[CCode (cheader_filename = "gst/netbuffer/gstnetbuffer.h", cprefix = "GST_NET_TYPE_", has_type_id = false)]
	public enum NetType {
		UNKNOWN,
		IP4,
		IP6
	}
	[CCode (cheader_filename = "gst/netbuffer/gstnetbuffer.h")]
	public const int NETADDRESS_MAX_LEN;
}
