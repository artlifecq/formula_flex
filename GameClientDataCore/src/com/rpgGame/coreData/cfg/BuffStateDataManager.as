package com.rpgGame.coreData.cfg
{
	import com.rpgGame.coreData.clientConfig.Q_buff;
	
	import flash.utils.ByteArray;
	
	import org.client.mainCore.ds.HashMap;

	/**
	 *
	 * 状态数据管理器
	 * @author L.L.M.Sunny
	 * 创建时间：2015-10-30 上午10:30:12
	 *
	 */
	public class BuffStateDataManager
	{
		public function BuffStateDataManager()
		{
		}
		
		// 技能/物品可添加的状态
		/**
		message FightStateProto{
			optional int32 id = 1; // id
			optional bytes name = 2; // 名字
			optional int32 group = 3; // 叠加层级
			optional int32 stack_type = 4; // 叠加类型
			optional bool is_buff = 5; // 是否是有益的
			optional bytes description = 6; // 描述
			optional int32 animation = 7; // 加在角色身上时播放的动画, 可能没有
			optional bool is_stun = 8; // 是否是晕眩
			optional bool is_unmovable = 9; // 是否无法行走和跳跃
			optional bool is_hush = 10; // 是否沉默, 无法放技能
			optional string icon = 11; // 图标
			optional bytes notice_on_add = 12; // 中了这个状态之后显示的提示信息
		}
		*/
		
		private static var _map:HashMap = new HashMap();

		public static function setConfig(data:ByteArray):void
		{
			var arr:Array = data.readObject();
			if(!arr)
				return;
			for each(var buffData:Q_buff in arr)
			{
				_map.add(buffData.q_buff_id,buffData);
			}
		}

		public static function getData(id:uint):Q_buff
		{
			return _map.getValue(id);
		}
	}
}