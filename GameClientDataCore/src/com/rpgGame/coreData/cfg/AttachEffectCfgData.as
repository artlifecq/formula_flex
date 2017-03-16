package com.rpgGame.coreData.cfg
{
    import com.rpgGame.coreData.clientConfig.Attach_effect;
    
    import flash.utils.ByteArray;
    
    import org.client.mainCore.ds.HashMap;

    public class AttachEffectCfgData
    {
        public function AttachEffectCfgData()
        {
        }
        private static var _map : HashMap;

        public static function setup(data : ByteArray) : void
		{
			var arr : Array = data.readObject();
			_map = new HashMap();
			for each (var info : Attach_effect in arr)
			{
				_map.add(info.q_id, info);
			}
		}

		public static function getInfo(id : int) :Attach_effect 
		{
			return _map.getValue(id);
		}
    }
}