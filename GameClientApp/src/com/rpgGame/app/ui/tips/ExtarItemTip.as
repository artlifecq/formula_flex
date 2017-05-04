package com.rpgGame.app.ui.tips
{
	import com.rpgGame.app.manager.mount.HorseExtraItemInfo;
	import com.rpgGame.app.manager.mount.MountShowData;
	import com.rpgGame.app.utils.FaceUtil;
	import com.rpgGame.app.view.icon.DragDropItem;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.core.view.ui.tip.implement.ITip;
	import com.rpgGame.coreData.cfg.AttValueConfig;
	import com.rpgGame.coreData.cfg.item.ItemContainerID;
	import com.rpgGame.coreData.clientConfig.Q_att_values;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.info.item.GridInfo;
	import com.rpgGame.coreData.type.CharAttributeType;
	
	import org.mokylin.skin.app.tips.Tips_DaoJu2;
	
	public class ExtarItemTip extends SkinUI implements ITip
	{
		private var _skin:Tips_DaoJu2;
		public function ExtarItemTip():void
		{
			_skin = new Tips_DaoJu2();
			super(_skin);
			initView();
		}
		private static var _instance:ExtarItemTip = null;
		public static function get instance() : ExtarItemTip
		{
			if (null == _instance)
			{
				_instance = new ExtarItemTip();
			}
			return _instance;
		}
		private var _iconFace:DragDropItem;
		private function initView():void
		{
			_iconFace=new DragDropItem(IcoSizeEnum.ICON_64,0);
			_iconFace.gridInfo=new GridInfo(ItemContainerID.BackPack,0);
			addChild(_iconFace);
			_iconFace.x=28;
			_iconFace.y=19;		
		}
		private var _item:HorseExtraItemInfo;
		public function setTipData(data:*):void
		{
			var show:MountShowData = data[0];
			var type:int = data[1];
			_item=show.getOpenLevelBytype(type);
			FaceUtil.SetItemGrid(_iconFace, _item.clientItemInfo);
			_skin.lbName.text = _item.clientItemInfo.qItem.q_name;
			var maxUseCount:int = _item.getMaxByLevel(show.mountLevel);
			var useCount:int = show.getUseExtralItem(type);
			_skin.lbCurrentNum.text = useCount.toString()+"/"+maxUseCount.toString()+"个";
			_skin.lbNextName.text = (_item.getMaxByLevel(show.mountLevel+1)-maxUseCount).toString()+"个";
			_skin.lbShuxing.width = 240;
			_skin.lbShuxing.wordWrap = true;
			refeashAddPropView();
			refeahAddPercentView();
			_skin.lbLuJing.text = _item.clientItemInfo.qItem.q_output.toString();
		}
		
		private function refeahAddPercentView():void
		{
			if(_item.clientItemInfo.cfgId!=404)
				return ;
			_skin.lbShuxing.htmlText = _item.clientItemInfo.qItem.q_describe;
			_skin.grp_type.visible = false;
			_skin.grp_foot.y = 182;
			_skin.bg.height = 250;
		}
		
		private function refeashAddPropView():void
		{
			if(_item.clientItemInfo.cfgId!=403)
				return ;
			_skin.lbShuxing.text = "每颗资质丹永久增加战骑属性：";
			_skin.grp_type.visible = true;
			var currentatt:Q_att_values = AttValueConfig.getAttInfoById(_item.clientItemInfo.qItem.q_att_type);
			var props:Vector.<Number> = new Vector.<Number>(30,0);
			var type:int;
			var value:int;
			for(var i:int = 1;i<=15;i++)
			{
				type = currentatt["q_type"+i];
				if(type==0)
					continue;
				value = currentatt["q_value"+i];
				props[type] = value;
			}
			_skin.lbGongJi.text = "+"+props[CharAttributeType.WAI_GONG];
			_skin.lbFangYu.text = "+"+props[CharAttributeType.DEFENSE_PER];
			_skin.lbShengMing.text = "+"+props[CharAttributeType.MAX_HP];
			_skin.grp_foot.y = 237;
			_skin.bg.height = 311;
		}
		
		public function hideTips():void
		{
		}
		
		public override function get height() : Number
		{
			return _skin.bg.height;
		}
	}
}