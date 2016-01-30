
var m_count = 0;
m_items = new Array(
"<h3>Default MPU Region Settings/Attributes</h3>",
"<h5>RM57D8.* Core0</h5>",
"<table border=1 cellpadding=3>",
 "<colgroup span=1></colgroup> <colgroup span=5 align=center></colgroup>",
   "<tr><th> Mpu Region Id </th><th> Base Address </th><th> Region Size </th><th> Region Enabled </th><th> Bufferable </th><th> Cacheable </th><th> Shareable </th><th> Tex </th><th> NoExecute </th><th> AccessPermission </th><th> SubregionDisableMask </th></tr>",
   "<tr><td> 0        </td><td> 0x0   </td><td> 4 GBytes         </td><td> true         </td><td> false         </td><td> false         </td><td> false         </td><td> 1         </td><td> false         </td><td> No Access at any Privilege Level         </td><td> 0xff         </td></tr>",
   "<tr><td> 1        </td><td> 0x0   </td><td> 4 MBytes         </td><td> true         </td><td> true         </td><td> true         </td><td> true         </td><td> 1         </td><td> false         </td><td> Supervisor and User R-only access         </td><td> 0x0         </td></tr>",
   "<tr><td> 2        </td><td> 0x8000000   </td><td> 256 KBytes         </td><td> true         </td><td> true         </td><td> true         </td><td> false         </td><td> 1         </td><td> true         </td><td> Supervisor and User RW access         </td><td> 0x0         </td></tr>",
   "<tr><td> 3        </td><td> 0x8040000   </td><td> 256 KBytes         </td><td> true         </td><td> true         </td><td> true         </td><td> false         </td><td> 1         </td><td> true         </td><td> No Access at any Privilege Level         </td><td> 0xc0         </td></tr>",
   "<tr><td> 4        </td><td> 0x8040000   </td><td> 256 KBytes         </td><td> true         </td><td> false         </td><td> false         </td><td> true         </td><td> 1         </td><td> true         </td><td> Supervisor and User RW access         </td><td> 0x3f         </td></tr>",
   "<tr><td> 5        </td><td> 0x60000000   </td><td> 256 MBytes         </td><td> true         </td><td> false         </td><td> false         </td><td> true         </td><td> 0         </td><td> false         </td><td> Supervisor and User RW access         </td><td> 0x0         </td></tr>",
   "<tr><td> 6        </td><td> 0x80000000   </td><td> 512 MBytes         </td><td> true         </td><td> false         </td><td> false         </td><td> false         </td><td> 1         </td><td> false         </td><td> Supervisor and User RW access         </td><td> 0x0         </td></tr>",
   "<tr><td> 7        </td><td> 0xf0000000   </td><td> 4 MBytes         </td><td> true         </td><td> false         </td><td> false         </td><td> false         </td><td> 1         </td><td> true         </td><td> Supervisor RW and User R-only access         </td><td> 0x0         </td></tr>",
   "<tr><td> 8        </td><td> 0xfb000000   </td><td> 16 MBytes         </td><td> true         </td><td> false         </td><td> false         </td><td> false         </td><td> 2         </td><td> true         </td><td> Supervisor and User RW access         </td><td> 0x0         </td></tr>",
   "<tr><td> 9        </td><td> 0xfc000000   </td><td> 16 MBytes         </td><td> true         </td><td> false         </td><td> false         </td><td> false         </td><td> 2         </td><td> true         </td><td> Supervisor RW and User R-only access         </td><td> 0x0         </td></tr>",
   "<tr><td> 10        </td><td> 0xfe000000   </td><td> 16 MBytes         </td><td> true         </td><td> false         </td><td> false         </td><td> false         </td><td> 2         </td><td> true         </td><td> Supervisor and User RW access         </td><td> 0xe0         </td></tr>",
   "<tr><td> 11        </td><td> 0xff000000   </td><td> 16 MBytes         </td><td> true         </td><td> false         </td><td> false         </td><td> false         </td><td> 2         </td><td> true         </td><td> Supervisor RW and User R-only access         </td><td> 0xc0         </td></tr>",
   "<tr><td> 15        </td><td> 0xfff80000   </td><td> 512 KBytes         </td><td> true         </td><td> false         </td><td> false         </td><td> false         </td><td> 2         </td><td> true         </td><td> Supervisor RW and User R-only access         </td><td> 0x0         </td></tr>",
 "</table>",
"<h5>RM57D8.* Core1</h5>",
"<table border=1 cellpadding=3>",
 "<colgroup span=1></colgroup> <colgroup span=5 align=center></colgroup>",
   "<tr><th> Mpu Region Id </th><th> Base Address </th><th> Region Size </th><th> Region Enabled </th><th> Bufferable </th><th> Cacheable </th><th> Shareable </th><th> Tex </th><th> NoExecute </th><th> AccessPermission </th><th> SubregionDisableMask </th></tr>",
   "<tr><td> 0        </td><td> 0x0   </td><td> 4 GBytes         </td><td> true         </td><td> false         </td><td> false         </td><td> false         </td><td> 1         </td><td> false         </td><td> No Access at any Privilege Level         </td><td> 0xff         </td></tr>",
   "<tr><td> 1        </td><td> 0x0   </td><td> 4 MBytes         </td><td> true         </td><td> true         </td><td> true         </td><td> true         </td><td> 1         </td><td> false         </td><td> Supervisor and User R-only access         </td><td> 0x0         </td></tr>",
   "<tr><td> 2        </td><td> 0x8000000   </td><td> 256 KBytes         </td><td> true         </td><td> true         </td><td> true         </td><td> false         </td><td> 1         </td><td> true         </td><td> No Access at any Privilege Level         </td><td> 0x0         </td></tr>",
   "<tr><td> 3        </td><td> 0x8040000   </td><td> 256 KBytes         </td><td> true         </td><td> true         </td><td> true         </td><td> false         </td><td> 1         </td><td> true         </td><td> Supervisor and User RW access         </td><td> 0xc0         </td></tr>",
   "<tr><td> 4        </td><td> 0x8040000   </td><td> 256 KBytes         </td><td> true         </td><td> false         </td><td> false         </td><td> true         </td><td> 1         </td><td> true         </td><td> Supervisor and User RW access         </td><td> 0x3f         </td></tr>",
   "<tr><td> 5        </td><td> 0x60000000   </td><td> 256 MBytes         </td><td> true         </td><td> false         </td><td> false         </td><td> true         </td><td> 0         </td><td> false         </td><td> Supervisor and User RW access         </td><td> 0x0         </td></tr>",
   "<tr><td> 6        </td><td> 0x80000000   </td><td> 512 MBytes         </td><td> true         </td><td> false         </td><td> false         </td><td> false         </td><td> 1         </td><td> false         </td><td> Supervisor and User RW access         </td><td> 0x0         </td></tr>",
   "<tr><td> 7        </td><td> 0xf0000000   </td><td> 4 MBytes         </td><td> true         </td><td> false         </td><td> false         </td><td> false         </td><td> 1         </td><td> true         </td><td> Supervisor RW and User R-only access         </td><td> 0x0         </td></tr>",
   "<tr><td> 8        </td><td> 0xfb000000   </td><td> 16 MBytes         </td><td> true         </td><td> false         </td><td> false         </td><td> false         </td><td> 2         </td><td> true         </td><td> Supervisor and User RW access         </td><td> 0x0         </td></tr>",
   "<tr><td> 9        </td><td> 0xfc000000   </td><td> 16 MBytes         </td><td> true         </td><td> false         </td><td> false         </td><td> false         </td><td> 2         </td><td> true         </td><td> Supervisor RW and User R-only access         </td><td> 0x0         </td></tr>",
   "<tr><td> 10        </td><td> 0xfe000000   </td><td> 16 MBytes         </td><td> true         </td><td> false         </td><td> false         </td><td> false         </td><td> 2         </td><td> true         </td><td> Supervisor and User RW access         </td><td> 0xe0         </td></tr>",
   "<tr><td> 11        </td><td> 0xff000000   </td><td> 16 MBytes         </td><td> true         </td><td> false         </td><td> false         </td><td> false         </td><td> 2         </td><td> true         </td><td> Supervisor RW and User R-only access         </td><td> 0xc0         </td></tr>",
   "<tr><td> 15        </td><td> 0xfff80000   </td><td> 512 KBytes         </td><td> true         </td><td> false         </td><td> false         </td><td> false         </td><td> 2         </td><td> true         </td><td> Supervisor RW and User R-only access         </td><td> 0x0         </td></tr>",
 "</table>",
"<h5>RM57D8xx Core0</h5>",
"<table border=1 cellpadding=3>",
 "<colgroup span=1></colgroup> <colgroup span=5 align=center></colgroup>",
   "<tr><th> Mpu Region Id </th><th> Base Address </th><th> Region Size </th><th> Region Enabled </th><th> Bufferable </th><th> Cacheable </th><th> Shareable </th><th> Tex </th><th> NoExecute </th><th> AccessPermission </th><th> SubregionDisableMask </th></tr>",
   "<tr><td> 0        </td><td> 0x0   </td><td> 4 GBytes         </td><td> true         </td><td> false         </td><td> false         </td><td> false         </td><td> 1         </td><td> false         </td><td> No Access at any Privilege Level         </td><td> 0xff         </td></tr>",
   "<tr><td> 1        </td><td> 0x0   </td><td> 4 MBytes         </td><td> true         </td><td> true         </td><td> true         </td><td> true         </td><td> 1         </td><td> false         </td><td> Supervisor and User R-only access         </td><td> 0x0         </td></tr>",
   "<tr><td> 2        </td><td> 0x8000000   </td><td> 256 KBytes         </td><td> true         </td><td> true         </td><td> true         </td><td> false         </td><td> 1         </td><td> true         </td><td> Supervisor and User RW access         </td><td> 0x0         </td></tr>",
   "<tr><td> 3        </td><td> 0x8040000   </td><td> 256 KBytes         </td><td> true         </td><td> true         </td><td> true         </td><td> false         </td><td> 1         </td><td> true         </td><td> No Access at any Privilege Level         </td><td> 0xc0         </td></tr>",
   "<tr><td> 4        </td><td> 0x8040000   </td><td> 256 KBytes         </td><td> true         </td><td> false         </td><td> false         </td><td> true         </td><td> 1         </td><td> true         </td><td> Supervisor and User RW access         </td><td> 0x3f         </td></tr>",
   "<tr><td> 5        </td><td> 0x60000000   </td><td> 256 MBytes         </td><td> true         </td><td> false         </td><td> false         </td><td> true         </td><td> 0         </td><td> false         </td><td> Supervisor and User RW access         </td><td> 0x0         </td></tr>",
   "<tr><td> 6        </td><td> 0x80000000   </td><td> 512 MBytes         </td><td> true         </td><td> false         </td><td> false         </td><td> false         </td><td> 1         </td><td> false         </td><td> Supervisor and User RW access         </td><td> 0x0         </td></tr>",
   "<tr><td> 7        </td><td> 0xf0000000   </td><td> 4 MBytes         </td><td> true         </td><td> false         </td><td> false         </td><td> false         </td><td> 1         </td><td> true         </td><td> Supervisor RW and User R-only access         </td><td> 0x0         </td></tr>",
   "<tr><td> 8        </td><td> 0xfb000000   </td><td> 16 MBytes         </td><td> true         </td><td> false         </td><td> false         </td><td> false         </td><td> 2         </td><td> true         </td><td> Supervisor and User RW access         </td><td> 0x0         </td></tr>",
   "<tr><td> 9        </td><td> 0xfc000000   </td><td> 16 MBytes         </td><td> true         </td><td> false         </td><td> false         </td><td> false         </td><td> 2         </td><td> true         </td><td> Supervisor RW and User R-only access         </td><td> 0x0         </td></tr>",
   "<tr><td> 10        </td><td> 0xfe000000   </td><td> 16 MBytes         </td><td> true         </td><td> false         </td><td> false         </td><td> false         </td><td> 2         </td><td> true         </td><td> Supervisor and User RW access         </td><td> 0xe0         </td></tr>",
   "<tr><td> 11        </td><td> 0xff000000   </td><td> 16 MBytes         </td><td> true         </td><td> false         </td><td> false         </td><td> false         </td><td> 2         </td><td> true         </td><td> Supervisor RW and User R-only access         </td><td> 0xc0         </td></tr>",
   "<tr><td> 15        </td><td> 0xfff80000   </td><td> 512 KBytes         </td><td> true         </td><td> false         </td><td> false         </td><td> false         </td><td> 2         </td><td> true         </td><td> Supervisor RW and User R-only access         </td><td> 0x0         </td></tr>",
 "</table>",
"<h5>RM57D8xx Core1</h5>",
"<table border=1 cellpadding=3>",
 "<colgroup span=1></colgroup> <colgroup span=5 align=center></colgroup>",
   "<tr><th> Mpu Region Id </th><th> Base Address </th><th> Region Size </th><th> Region Enabled </th><th> Bufferable </th><th> Cacheable </th><th> Shareable </th><th> Tex </th><th> NoExecute </th><th> AccessPermission </th><th> SubregionDisableMask </th></tr>",
   "<tr><td> 0        </td><td> 0x0   </td><td> 4 GBytes         </td><td> true         </td><td> false         </td><td> false         </td><td> false         </td><td> 1         </td><td> false         </td><td> No Access at any Privilege Level         </td><td> 0xff         </td></tr>",
   "<tr><td> 1        </td><td> 0x0   </td><td> 4 MBytes         </td><td> true         </td><td> true         </td><td> true         </td><td> true         </td><td> 1         </td><td> false         </td><td> Supervisor and User R-only access         </td><td> 0x0         </td></tr>",
   "<tr><td> 2        </td><td> 0x8000000   </td><td> 256 KBytes         </td><td> true         </td><td> true         </td><td> true         </td><td> false         </td><td> 1         </td><td> true         </td><td> No Access at any Privilege Level         </td><td> 0x0         </td></tr>",
   "<tr><td> 3        </td><td> 0x8040000   </td><td> 256 KBytes         </td><td> true         </td><td> true         </td><td> true         </td><td> false         </td><td> 1         </td><td> true         </td><td> Supervisor and User RW access         </td><td> 0xc0         </td></tr>",
   "<tr><td> 4        </td><td> 0x8040000   </td><td> 256 KBytes         </td><td> true         </td><td> false         </td><td> false         </td><td> true         </td><td> 1         </td><td> true         </td><td> Supervisor and User RW access         </td><td> 0x3f         </td></tr>",
   "<tr><td> 5        </td><td> 0x60000000   </td><td> 256 MBytes         </td><td> true         </td><td> false         </td><td> false         </td><td> true         </td><td> 0         </td><td> false         </td><td> Supervisor and User RW access         </td><td> 0x0         </td></tr>",
   "<tr><td> 6        </td><td> 0x80000000   </td><td> 512 MBytes         </td><td> true         </td><td> false         </td><td> false         </td><td> false         </td><td> 1         </td><td> false         </td><td> Supervisor and User RW access         </td><td> 0x0         </td></tr>",
   "<tr><td> 7        </td><td> 0xf0000000   </td><td> 4 MBytes         </td><td> true         </td><td> false         </td><td> false         </td><td> false         </td><td> 1         </td><td> true         </td><td> Supervisor RW and User R-only access         </td><td> 0x0         </td></tr>",
   "<tr><td> 8        </td><td> 0xfb000000   </td><td> 16 MBytes         </td><td> true         </td><td> false         </td><td> false         </td><td> false         </td><td> 2         </td><td> true         </td><td> Supervisor and User RW access         </td><td> 0x0         </td></tr>",
   "<tr><td> 9        </td><td> 0xfc000000   </td><td> 16 MBytes         </td><td> true         </td><td> false         </td><td> false         </td><td> false         </td><td> 2         </td><td> true         </td><td> Supervisor RW and User R-only access         </td><td> 0x0         </td></tr>",
   "<tr><td> 10        </td><td> 0xfe000000   </td><td> 16 MBytes         </td><td> true         </td><td> false         </td><td> false         </td><td> false         </td><td> 2         </td><td> true         </td><td> Supervisor and User RW access         </td><td> 0xe0         </td></tr>",
   "<tr><td> 11        </td><td> 0xff000000   </td><td> 16 MBytes         </td><td> true         </td><td> false         </td><td> false         </td><td> false         </td><td> 2         </td><td> true         </td><td> Supervisor RW and User R-only access         </td><td> 0xc0         </td></tr>",
   "<tr><td> 15        </td><td> 0xfff80000   </td><td> 512 KBytes         </td><td> true         </td><td> false         </td><td> false         </td><td> false         </td><td> 2         </td><td> true         </td><td> Supervisor RW and User R-only access         </td><td> 0x0         </td></tr>",
 "</table>",
"<!-- -->"
);

// gen below code only 1 time
while (m_count < m_items.length) {
    document.write(m_items[m_count]);
    m_count++;
}