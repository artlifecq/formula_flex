package com.rpgGame.app.ui.tips
{
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.utils.FaceUtil;
	import com.rpgGame.app.view.icon.IconCDFace;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.core.view.ui.tip.implement.ITip;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.info.item.ClientItemInfo;
	import com.rpgGame.coreData.role.HeroData;
	import com.rpgGame.coreData.type.item.GridBGType;
	import com.rpgGame.coreData.utils.HtmlTextUtil;
	
	import feathers.controls.Label;
	import feathers.controls.UIAsset;
	
	import org.mokylin.skin.app.tips.daojuTips_Skin;

	/**
	 * 物品TIPS
	 * @author luguozheng
	 * @modifier L.L.M.Sunny
	 * 修改时间：2016-09-06 下午3:05:12
	 *
	 */
	public class ItemTip extends SkinUI implements ITip
	{
		private var _itemTip : daojuTips_Skin;//ItemTipsSkin;
		/** 物品信息类 **/
		private var _itemInfo : ClientItemInfo;
		
		private var goldIcon:UIAsset;
		private var yinIcon:UIAsset;
		
		/** 装备格子 **/
		private var _iconFace:IconCDFace;

		public function ItemTip()
		{
			_itemTip = new daojuTips_Skin();
			super(_itemTip);
			initTip();
		}

		/**
		 * 初始化
		 *
		 */
		private function initTip() : void
		{
//			_itemTip.labDecTxt.leading = 5;
//			_itemTip.labDecTxt.color = StaticValue.COLOR_CODE_1;
//			_itemTip.labDecTxt.maxWidth = _itemTip.labDecTxt.width = 240;
			
			_iconFace=new IconCDFace(IcoSizeEnum.SIZE_60);
			addChild(_iconFace);
			_iconFace.setBg(GridBGType.GRID_SIZE_60);
			_iconFace.x=30;
			_iconFace.y=67;
			_iconFace.setIconPoint(8, 8);
			
			goldIcon=new UIAsset();
			goldIcon.styleName="ui/common/tubiao/lijin_24.png";
			yinIcon=new UIAsset();
			yinIcon.styleName="ui/common/tubiao/yinzi_24.png";
		}

		/**
		 * 设置物品数据tips
		 * @param data
		 *
		 */
		public function setTipData(data : *) : void
		{
			_itemInfo = data as ClientItemInfo;

			if (_itemInfo == null)
			{
				return;
			}
			
			//设置装备格子信息
			FaceUtil.SetItemGrid(_iconFace, _itemInfo, false);
			
			_itemTip.lbl_name.text=_itemInfo.qItem.q_name;
			_itemTip.lbl_lock.visible=true;
			if(_itemInfo.binded){
				_itemTip.lbl_lock.text="[已绑定]"
			}else{
				if(_itemInfo.qItem.q_bind==0){
					_itemTip.lbl_lock.visible=false;
				}else if(_itemInfo.qItem.q_bind==1){
					_itemTip.lbl_lock.visible="[获得时绑定]";
				}else{
					_itemTip.lbl_lock.visible="[使用后绑定]";
				}
			}
			
			var nameColor:uint=0x8b8d7b;
			var valueColor:uint=0xcfc6ae;
			var valueColor1:uint=0xE1201C;
			var valueColor2:uint=0x6BCC08;
			
			curY=93;
			curX=10;
			var name:String;
			var value:String;
			var info:HeroData=MainRoleManager.actorInfo;
			if(_itemInfo.qItem.q_level!=0){//等级要求
				name=HtmlTextUtil.getTextColor(nameColor,"等级要求:");
				if(info.totalStat.level<_itemInfo.qItem.q_level){
					value=HtmlTextUtil.getTextColor(valueColor1,_itemInfo.qItem.q_level.toString());
				}else{
					value=HtmlTextUtil.getTextColor(valueColor,_itemInfo.qItem.q_level.toString());
				}
				createLabel(name,value);
				curX=150;
			}
			
			if(_itemInfo.qItem.q_cooldown!=0){//冷却时间
				name=HtmlTextUtil.getTextColor(nameColor,"冷却时间:");
				value=HtmlTextUtil.getTextColor(valueColor,(_itemInfo.qItem.q_cooldown/1000)+"秒");
				createLabel(name,value);
			}
			curY+=22;
			
			curX=10;
			if(_itemInfo.qItem.q_dailylimit!=0){//今日使用次数
				name=HtmlTextUtil.getTextColor(nameColor,"今日使用次数:");
				value=HtmlTextUtil.getTextColor(valueColor,"0/"+_itemInfo.qItem.q_dailylimit);
				createLabel(name,value);
				curY+=22;
			}
			
			if(_itemInfo.qItem.q_weeklimit!=0){//今日使用次数
				name=HtmlTextUtil.getTextColor(nameColor,"每周使用次数:");
				value=HtmlTextUtil.getTextColor(valueColor,"0/"+_itemInfo.qItem.q_weeklimit);
				createLabel(name,value);
				curY+=22;
			}
			
			name=HtmlTextUtil.getTextColor(nameColor,"[物品说明]\n");
			var label:Label=createLabel(name,_itemInfo.qItem.q_describe);
			label.width=250;
			label.leading=5;
			label.wordWrap=true;
			curY+=label.height;
			
			if(_itemInfo.itemInfo.lostTime==0){
				name=HtmlTextUtil.getTextColor(nameColor,"类别:");
				value=HtmlTextUtil.getTextColor(valueColor,"永久");
			}else{
				name=HtmlTextUtil.getTextColor(nameColor,"时效:");
				value=HtmlTextUtil.getTextColor(valueColor,_itemInfo.itemInfo.lostTime.toString());
			}
			createLabel(name,value);
			curY+=22;
			
			name=HtmlTextUtil.getTextColor(nameColor,"商城定价:");
			if(_itemInfo.qItem.q_gold==0){
				value=HtmlTextUtil.getTextColor(valueColor2,"      "+_itemInfo.qItem.q_gold.toString());
				yinIcon.removeFromParent();
				_itemTip.container.addChild(goldIcon);
			}else{
				value=HtmlTextUtil.getTextColor(valueColor2,"     "+_itemInfo.qItem.q_sell_price.toString());
				goldIcon.removeFromParent();
				_itemTip.container.addChild(yinIcon);
			}
			label=createLabel(name,value);
			goldIcon.x=yinIcon.x=100;
			goldIcon.y=yinIcon.y=curY;
			_itemTip.bg.height=curY+25;
		}
		
		private function createLabel(name:String,value:String):Label
		{
			var label:Label=new Label();
			label.fontSize=14;
			label.htmlText=name+value;
			label.y=curY;
			label.x=curX;
			_itemTip.container.addChild(label);
			return label;
		}
		

		public function hideTips() : void
		{
			
		}

		/**
		 * 获取物品tips背景高度
		 * @return
		 *
		 */
		public override function get height() : Number
		{

			return _itemTip.height;
		}

		private static var _instance : ItemTip = null;

		private var curY:int;

		private var curX:int;


		public static function get instance() : ItemTip
		{
			if (null == _instance)
			{
				_instance = new ItemTip();
			}
			return _instance;
		}
	}
}
