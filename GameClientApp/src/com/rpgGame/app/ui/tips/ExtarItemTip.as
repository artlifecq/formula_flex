package com.rpgGame.app.ui.tips
{
	import com.rpgGame.app.manager.mount.HorseExtraItemInfo;
	import com.rpgGame.app.manager.mount.MountShowData;
	import com.rpgGame.app.manager.mount.ZhanQiExtraItemInfo;
	import com.rpgGame.app.utils.FaceUtil;
	import com.rpgGame.app.view.icon.DragDropItem;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.core.view.ui.tip.implement.ITip;
	import com.rpgGame.coreData.cfg.AttValueConfig;
	import com.rpgGame.coreData.cfg.HorseConfigData;
	import com.rpgGame.coreData.cfg.ZhanQiConfigData;
	import com.rpgGame.coreData.cfg.item.ItemContainerID;
	import com.rpgGame.coreData.clientConfig.Q_att_values;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.info.item.GridInfo;
	
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
		private var _item:*;//HorseExtraItemInfo;
		private var _show:*;//MountShowData;
		public function setTipData(data:*):void
		{
			_show = data[0];
			var type:int = data[1];
			_item=_show.getOpenLevelBytype(type);
			FaceUtil.SetItemGrid(_iconFace, _item.clientItemInfo);
			_skin.lbName.text = _item.clientItemInfo.qItem.q_name;
			if(_show is MountShowData)
				var maxUseCount:int = (_item as HorseExtraItemInfo).getMaxByLevel(_show.mountLevel);
			else maxUseCount = (_item as ZhanQiExtraItemInfo).getMaxByLevel(_show.zhanqiLevel);
			var useCount:int = _show.getUseExtralItem(type);
			_skin.lbCurrentNum.text = useCount.toString()+"/"+maxUseCount.toString()+"个";
			if(_show is MountShowData){
				if(_show.mountLevel < HorseConfigData.maxCount)
					_skin.lbNextName.text = ((_item as HorseExtraItemInfo).getMaxByLevel(_show.mountLevel+1)-maxUseCount).toString()+"个";
				else
					_skin.lbNextName.text = "已满阶";
			}
			else {
				if(_show.zhanqiLevel < ZhanQiConfigData._maxLevel)
					_skin.lbNextName.text = ((_item as ZhanQiExtraItemInfo).getMaxByLevel(_show.zhanqiLevel+1)-maxUseCount).toString()+"个";
				else
					_skin.lbNextName.text = "已满阶";
			}
			_skin.lbShuxing.width = 240;
			_skin.lbShuxing.wordWrap = true;
			refeashAddPropView();
			refeahAddPercentView();
			_skin.lbLuJing.text = _item.clientItemInfo.qItem.q_output.toString();
		}
		
		private function refeahAddPercentView():void
		{
			if(_item.clientItemInfo.cfgId!=404&&_item.clientItemInfo.cfgId!=407)
				return ;
			_skin.lbShuxing.htmlText = _item.clientItemInfo.qItem.q_describe;
			_skin.grp_type.visible = false;
			_skin.ui_xian3.y=215;
			_skin.grp_foot.y = _skin.ui_xian3.y + 11;
			_skin.bg_bai.height = _skin.ui_di.y = 250;
		}
		
		private function refeashAddPropView():void
		{
			if(_item.clientItemInfo.cfgId!=403&&_item.clientItemInfo.cfgId!=406)
				return ;
			if(_item is HorseExtraItemInfo)
				_skin.lbShuxing.text = "每颗资质丹永久增加坐骑属性：";
			else if(_item is ZhanQiExtraItemInfo)
				_skin.lbShuxing.text = "每颗资质丹永久增加战旗属性：";
			_skin.grp_type.visible = true; 
			var currentatt:Q_att_values = AttValueConfig.getAttInfoById(_show.exartPropId);
			_skin.lbGongJi.text = "+"+AttValueConfig.getDisAttValue(currentatt.q_type1,currentatt.q_value1);
			_skin.lbFangYu.text = "+"+AttValueConfig.getDisAttValue(currentatt.q_type2,currentatt.q_value2);
			_skin.lbShengMing.text = "+"+AttValueConfig.getDisAttValue(currentatt.q_type3,currentatt.q_value3);
			
			_skin.ui_xian3.y=259;	
			_skin.grp_foot.y = _skin.ui_xian3.y + 11;
			_skin.bg_bai.height = _skin.ui_di.y = 311;
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