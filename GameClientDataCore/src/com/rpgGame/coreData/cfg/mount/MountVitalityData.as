package com.rpgGame.coreData.cfg.mount
{
	import com.rpgGame.coreData.SpriteStat;
	
	import app.message.SpriteStatProto;
	import app.message.MountVitalityDatasProto.MountVitalityDataProto;

	/**
	 * 坐骑根骨 单元数据
	 * @author 陈鹉光
	 * 
	 */	
	public class MountVitalityData
	{
		/** 根骨 **/
		public var vitality:int;
		/** 基础属性Proto **/
		private var _stat:SpriteStat;
		/** 基础属性 **/
		private var baseSpriteStat:SpriteStatProto;
		
		public function MountVitalityData()
		{
			_stat = new SpriteStat();
		}
		
		/**
		 *  
		 * @param data
		 * 
		 */		
		public function setData( data:MountVitalityDataProto ):void
		{
			if( data == null )
				return;
			
			vitality = data.vitality;
			baseSpriteStat = data.stat;
			_stat.setData( baseSpriteStat );
		}

		/** 基础属性Proto **/
		public function get stat():SpriteStat
		{
			return _stat;
		}

	}
}