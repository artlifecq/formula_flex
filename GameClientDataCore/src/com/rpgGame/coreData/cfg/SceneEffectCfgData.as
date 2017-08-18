package com.rpgGame.coreData.cfg
{
	import com.rpgGame.coreData.clientConfig.ClientSceneEffect;
	import com.rpgGame.coreData.clientConfig.Q_map_effect;
	
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;
	
	import org.client.mainCore.ds.HashMap;

	/**
	 * 场景动态特性类
	 * @author yt
	 * 
	 */
	public class SceneEffectCfgData
	{
		private static var _dataDic : Dictionary = new Dictionary();
		private static var _map : HashMap = new HashMap();
		public static function setup(data : ByteArray) : void {
			var arr : Array = data.readObject();
			var list : Vector.<ClientSceneEffect>;
			var sceneEffect:ClientSceneEffect;
			for each (var info : Q_map_effect in arr)
			{
				sceneEffect=new ClientSceneEffect();
				sceneEffect.id=info.q_id;
				sceneEffect.name=info.q_name;
				sceneEffect.sceneID=info.q_map_id;
				sceneEffect.effectRes=info.q_res;
				sceneEffect.bornPos=info.q_pos;
				sceneEffect.direction=info.q_direction;
				sceneEffect.sizeScale=info.q_scale;
				
				list = _dataDic[sceneEffect.sceneID];
				if (!list)
				{
					list = new Vector.<ClientSceneEffect>();
					_dataDic[sceneEffect.sceneID] = list;
				}
				list.push(sceneEffect);
				_map.add(sceneEffect.id, sceneEffect);
			}
		}	
		
		public static function getSceneEffectInfoList(sceneID : uint) : Vector.<ClientSceneEffect>
		{
			return _dataDic[sceneID];
		}
		
		public static function getData(id : uint) : ClientSceneEffect
		{
			return _map.getValue(id);
		}

		
		public function SceneEffectCfgData()
		{
		}
	}
}