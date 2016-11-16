package org.game.netCore.data
{
    import org.game.netCore.data.Int64;
    
    /**
     * 64位数据类型，相当于QWORD，主要用于和服务器对接
     * @author ty
     */
    public class long extends Int64
    {
		public function long(value:* = 0)
		{
			super(value);
		}
		
		public function Clone():long
		{
			var ret:long = new long();
			ret.SetRawData(_lValue, _hValue, _hexValue);
			return ret;
		}
	}
    
}
