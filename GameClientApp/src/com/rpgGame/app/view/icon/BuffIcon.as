package com.rpgGame.app.view.icon
{
	import com.game.engine3D.core.poolObject.IInstancePoolClass;
	import com.game.engine3D.core.poolObject.InstancePool;
	import com.rpgGame.core.manager.tips.TargetTipsMaker;
	import com.rpgGame.core.manager.tips.TipTargetManager;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.clientConfig.Q_tipsinfo;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.info.buff.BuffData;
	import com.rpgGame.coreData.type.TipType;
	
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;

	/**
	 *buff图标 
	 * @author dik
	 * 
	 */
	public class BuffIcon extends IconCDFace   implements IInstancePoolClass
	{
		private static var _pool : InstancePool = new InstancePool("BuffIcon", 100);

		/**
		 *创建一个buff图标 
		 * @param size
		 * @return 
		 * 
		 */
		public static function create(size:int) : BuffIcon
		{
			return _pool.createObj(BuffIcon, size) as BuffIcon;
		}
		
		public static function recycle(icon : BuffIcon) : void
		{
			if (!icon)
				return;
			_pool.disposeObj(icon);
		}
		
		
		private var _buffData:BuffData;
		
		public function BuffIcon($iconSize:int=IcoSizeEnum.ICON_36)
		{
			super($iconSize);
			var txtFormat:TextFormat=new TextFormat(null, 12, 0x8b8d7b, true, null, null, null, null, TextFormatAlign.CENTER);
			this.setIsShowCdTm( true ,txtFormat);
		}
		
		override public function sortLayer():void
		{
			if( _bgImage != null )
				addChild( _bgImage );
			
			if( _iconImage != null )
				addChild( _iconImage );
		}
		
		public function get buffData():BuffData
		{
			return _buffData;
		}
		
		public function set buffData(value:BuffData):void
		{
			_buffData = value;
			this.setIconResName(ClientConfig.getBuffIcon(_buffData.buffData.q_icon, _iconSize ));
//			this.setIconResName(ClientConfig.getItemIcon("101", IcoSizeEnum.ICON_36 ));
			sortLayer();
			this.faceInfo=buffData;
			var info:Q_tipsinfo=new Q_tipsinfo();
			info.q_describe_tittle=_buffData.buffData.q_buff_name;
			info.q_describe=_buffData.buffData.q_description;
			TipTargetManager.show(this, TargetTipsMaker.makeTips( TipType.NORMAL_TIP,info));
		}
		
		public  function instanceDispose() : void
		{
			clear();
			_buffData=null;
		}
		
		public	function instanceDestroy() : void
		{
			clear();
			_buffData=null;
		}
		
		public	function reSet(parameters : Array) : void
		{
			
		}
	}
}