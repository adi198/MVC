//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace mvcshopping.EDM
{
    using System;
    using System.Collections.Generic;
    
    public partial class tblproduct
    {
        public decimal p_id { get; set; }
        public string p_name { get; set; }
        public decimal p_price { get; set; }
        public int p_qty { get; set; }
        public decimal cat_id { get; set; }
        public decimal subcat_id { get; set; }
        public string p_desc { get; set; }
        public string p_img_original { get; set; }
        public string p_img1 { get; set; }
        public string p_img2 { get; set; }
        public string p_status { get; set; }
    }
}
