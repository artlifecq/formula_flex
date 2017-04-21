package com.rpgGame.appModule.jingmai.render
{
	import com.gameClient.utils.HashMap;
	import com.rpgGame.app.view.icon.BgIcon;
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
		private var labs:Array=[];
		public function StoneSelectCellExt()
		{
			_skin=new StoneItem_Skin();
			super(_skin);
			_icon=new BgIcon(IcoSizeEnum.ICON_42);
			_skin.Icon.addChild(_icon);
			_icon.x=6;
			_icon.y=6;
			MCUtil.removeSelf(_skin.txt_xianzhi);
		}
		public function setData(data:*):void
		{
			var item:ClientItemInfo=data as ClientItemInfo;
			for each (var lab:Label in labs) 
			{
				MCUtil.removeSelf(lab);
			}
			labs.length=0;
			if (item) 
			{
				var qItem:Q_item=item.qItem;
				_icon.setIconResName(ClientConfig.getSkillIcon(item.qItem.q_icon.toString(),IcoSizeEnum.ICON_42));
				_skin.txt_Name.text=qItem.q_name;
				_skin.txt_Name.color=ItemConfig.getItemQualityColor(qItem.q_id);
				_skin.txt_level.text="Lv"+qItem.q_levelnum;
				if (qItem.q_att_type!=0) 
				{
					var attr:HashMap=new HashMap();
					AttValueConfig.getTypeValue(qItem.q_att_type,attr);
					if (attr.size()>0) 
					{
						labs=labs.concat(AttrUtil.showAttr(attr,this,_skin.txt_xianzhi,10,new Point(_skin.txt_xianzhi.x,_skin.txt_xianzhi.y),_skin.txt_xianzhi.width+2,_skin.txt_xianzhi.height,"+"));
					}
				}
			}
		}
		public function clearData():void
		{
			
		}
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
		}
	}
}