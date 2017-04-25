package com.rpgGame.appModule.jingmai.render
{
	import com.gameClient.utils.HashMap;
	import com.rpgGame.app.view.icon.BgIcon;
	import com.rpgGame.appModule.jingmai.MeridianStoneSelectPanelExt;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.core.utils.AttrUtil;
	import com.rpgGame.core.utils.MCUtil;
	import com.rpgGame.coreData.cfg.AttValueConfig;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.cfg.item.ItemConfig;
	import com.rpgGame.coreData.clientConfig.Q_item;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.info.item.ClientItemInfo;
	
	import flash.geom.Point;
	
	import feathers.controls.Label;
	
	import org.mokylin.skin.app.beibao.jingmai.StoneItem_Skin;
	
	import starling.display.DisplayObject;
	
	public class StoneSelectCellExt extends SkinUI
	{
		private var _skin:StoneItem_Skin;
		private var _icon:BgIcon;
	
		private var _item:ClientItemInfo;
		public function StoneSelectCellExt()
		{
			_skin=new StoneItem_Skin();
			
			super(_skin);
			_icon=new BgIcon(IcoSizeEnum.ICON_36);
			_skin.Icon.addChild(_icon);
			
		}
		public function setData(data:*):void
		{
			_item=data as ClientItemInfo;
		
			if (_item) 
			{
				var qItem:Q_item=_item.qItem;
				_icon.setIconResName(ClientConfig.getItemIcon(_item.qItem.q_icon.toString(),IcoSizeEnum.ICON_36));
				_skin.lbName.text=qItem.q_name+" Lv"+qItem.q_levelnum;
				_skin.lbName.color=ItemConfig.getItemQualityColor(qItem.q_id);
				if (qItem.q_att_type!=0) 
				{
					var attr:HashMap=new HashMap();
					AttValueConfig.getTypeValue(qItem.q_att_type,attr);
					if (attr.size()>0) 
					{
						AttrUtil.showAttrInSingleLab(attr,_skin.lbJiacheng,",","+");
					}
				}
			}
		}
		public function clearData():void
		{
			_icon.clear();
			_item=null;
		}
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			if (_item) 
			{
				MeridianStoneSelectPanelExt.selectStone(_item);
			}
		}
	}
}