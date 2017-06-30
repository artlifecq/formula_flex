package com.rpgGame.app.ui.tips
{
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.utils.FaceUtil;
	import com.rpgGame.app.view.icon.DragDropItem;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.core.utils.MCUtil;
	import com.rpgGame.core.view.ui.tip.implement.ITip;
	import com.rpgGame.coreData.cfg.StaticValue;
	import com.rpgGame.coreData.cfg.item.ItemConfig;
	import com.rpgGame.coreData.cfg.item.ItemContainerID;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.enum.item.ItemLimitType;
	import com.rpgGame.coreData.info.item.ClientItemInfo;
	import com.rpgGame.coreData.info.item.GridInfo;
	import com.rpgGame.coreData.role.HeroData;
	import com.rpgGame.coreData.utils.HtmlTextUtil;
	
	import feathers.controls.Label;
	import feathers.controls.UIAsset;
	
	import org.mokylin.skin.app.tips.Tips_DaoJu1;
	
	/**
	 * 物品TIPS
	 * @author luguozheng
	 * @modifier L.L.M.Sunny
	 * 修改时间：2016-09-06 下午3:05:12
	 *
	 */
	public class ItemTip extends SkinUI implements ITip
	{
		private var _itemTip : Tips_DaoJu1;
		/** 物品信息类 **/
		private var _itemInfo : ClientItemInfo;
		
		private var yinIcon:UIAsset;
		
		/** 装备格子 **/
		private var _iconFace:DragDropItem;
		
		private var labelList:Vector.<Label>;
		private var lines:Vector.<UIAsset>;
		private var uititles:Vector.<UIAsset>;
		
		public function ItemTip()
		{
			_itemTip = new Tips_DaoJu1();
			super(_itemTip);
			initTip();
		}
		
		/**
		 * 初始化
		 *
		 */
		private function initTip() : void
		{
			_iconFace=new DragDropItem(IcoSizeEnum.ICON_64,0);
			_iconFace.gridInfo=new GridInfo(ItemContainerID.BackPack,0);
			addChild(_iconFace);
			_iconFace.x=12;
			_iconFace.y=39;
			labelList=new Vector.<Label>();
			lines=new Vector.<UIAsset>();
			uititles=new Vector.<UIAsset>();
			yinIcon=new UIAsset();
			yinIcon.styleName="ui/common/tubiao/yinzi_24.png";
		}
		
		//创建美术资源——UIASSET
		private function createUiAsset(name:String):UIAsset
		{
			var uiasset:UIAsset=new UIAsset();
			uiasset.name = name;
			uiasset.height = 17;
			uiasset.styleName = "ui/common/tips/tipswenzi/jineng/"+name+".png";
			uiasset.x = curX;
			uiasset.y = curY;
			uititles.push(uiasset);
			_itemTip.container.addChild(uiasset);
			return uiasset;
		}
		
		//创建文字——LABLE
		private function createLabel(name:String,value:String):Label
		{
			var label:Label=new Label();
			label.fontSize=14;
			label.htmlText=name+value;
			label.y=curY;
			label.x=curX;
			labelList.push(label);
			_itemTip.container.addChild(label);
			return label;
		}
		
		//创建美术资源——线
		private function createLine(x:int,y:int,w:int):void
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/tips/xian.png";
			temp.width=w;
			temp.x=x;
			temp.y=y;
			lines.push(temp);
			_itemTip.container.addChild(temp);
		}
		
		/**
		 * 设置物品数据tips
		 * @param data
		 *
		 */
		public function setTipData(data : *) : void
		{
			_itemInfo = data as ClientItemInfo;
			
			while(labelList.length!=0){
				var l:Label=labelList.shift();
				l.removeFromParent(true);
			}
			
			while(lines.length!=0){
				var line:UIAsset=lines.shift();
				line.removeFromParent(true);
			}
			
			while(uititles.length!=0)
			{
				var uititle:UIAsset=uititles.shift();
				uititle.removeFromParent(true);
			}
			
			if (_itemInfo == null)
			{
				return;
			}
			
			//设置装备格子信息
			FaceUtil.SetItemGrid(_iconFace, _itemInfo);
			_iconFace.countText.visible=false;
			
			
			_itemTip.lbName.color=ItemConfig.getItemQualityColor(_itemInfo.cfgId);
			_itemTip.lbName.text=_itemInfo.qItem.q_name;
			_itemTip.lbBangding.visible=true;
			if(_itemInfo.binded){
				_itemTip.lbBangding.text="【已绑定】";
			}else{
				if(_itemInfo.qItem.q_bind==0){
					_itemTip.lbBangding.visible=false;
				}else if(_itemInfo.qItem.q_bind==1){
					_itemTip.lbBangding.text="【获得时绑定】";
				}else{
					_itemTip.lbBangding.text="【使用后绑定】";
				}
			}
			var title:UIAsset;
			var name:String;
			var value:String;
			var info:HeroData=MainRoleManager.actorInfo;
			//等级要求
			if(_itemInfo.qItem.q_level!=0){
				
				_itemTip.lb1.text="等级要求:";
				_itemTip.lbDengji.text=_itemInfo.qItem.q_level.toString();
				if(info.totalStat.level<_itemInfo.qItem.q_level){
					_itemTip.lbDengji.color=StaticValue.A_UI_RED_TEXT;
				}else{
					_itemTip.lbDengji.color=StaticValue.A_UI_BEIGE_TEXT;
				}
			}
			
			//叠加上限
			curY=67;
			_itemTip.lb2.text="叠加上限:";
			_itemTip.lbXiaohao.text=_itemInfo.qItem.q_max>0?_itemInfo.qItem.q_max.toString():"1";
			_itemTip.lbXiaohao.color=StaticValue.A_UI_BEIGE_TEXT;
			_itemTip.lb2.visible=true;
			_itemTip.lbXiaohao.visible=true;
			_itemTip.lb2.y=_itemTip.lbXiaohao.y=curY;
			curY+=20;
			
			//冷却时间
			if(_itemInfo.qItem.q_cooldown!=0){
				_itemTip.lb3.text="冷却时间:";
				_itemTip.lbXiuwei.text=(_itemInfo.qItem.q_cooldown/1000)+"秒";
				_itemTip.lbXiuwei.color=StaticValue.A_UI_BEIGE_TEXT;
				_itemTip.lb3.visible=true;
				_itemTip.lbXiuwei.visible=true;
				_itemTip.lb3.y=_itemTip.lbXiuwei.y=curY;
				curY+=20;
			}
			else
			{
				_itemTip.lb3.visible=false;
				_itemTip.lbXiuwei.visible=false;
			}
			
			curY=120;
			//使用次数
			var label:Label;
			if(_itemInfo.itemInfo){//物品存在的情况下
				if(_itemInfo.itemInfo.limitType>0){
					switch(_itemInfo.itemInfo.limitType){
						case ItemLimitType.LIMIT_DAY:
							_itemTip.lb4.text="今日使用次数";
							break;
						case ItemLimitType.LIMIT_WEEK:
							_itemTip.lb4.text="本周使用次数";
							break;
						case ItemLimitType.LIMIT_MONTH:
							_itemTip.lb4.text="本月使用次数";
							break;
						case ItemLimitType.LIMIT_YEAR:
							_itemTip.lb4.text="本年使用次数";
							break;
					}
					_itemTip.lbCishu.text=_itemInfo.itemInfo.limitValue+"/"+_itemInfo.itemInfo.limitNum;
					_itemTip.lbCishu.color=StaticValue.A_UI_BEIGE_TEXT;
					_itemTip.lb4.y=_itemTip.lbCishu.y=curY;
					_itemTip.lb4.visible=_itemTip.lbCishu.visible=true;
					curY+=27;
				}	
				else{
					_itemTip.lb4.visible=_itemTip.lbCishu.visible=false;
				}
				_itemTip.imgLine1.y=curY;
				curY+=13;
				//物品说明
				curX=13;
				createUiAsset("wupinshuoming");
				curY+=17;
				label=createLabel(_itemInfo.qItem.q_describe,"");
				label.width=250;
				label.leading=5;
				label.wordWrap=true;
				curY+=27;
				createLine(10,curY,263);
				curY+=13;
				
				//时效
				createUiAsset("wupinshuoming");
				curY+=17;
				if(_itemInfo.itemInfo.lostTime==0){
					name=HtmlTextUtil.getTextColor(StaticValue.A_UI_GRAY_TEXT,"类别:");
					value=HtmlTextUtil.getTextColor(StaticValue.A_UI_BEIGE_TEXT,"永久");
				}else{
					name=HtmlTextUtil.getTextColor(StaticValue.A_UI_GRAY_TEXT,"时效:");
					value=HtmlTextUtil.getTextColor(StaticValue.A_UI_BEIGE_TEXT,_itemInfo.itemInfo.lostTime.toString());
				}
				createLabel(name,value);
				curY+=27;
				
			}else{
				//物品说明
				curX=13;
				curY=137;	
				createUiAsset("wupinshuoming");
				curY+=17;
				label=createLabel(_itemInfo.qItem.q_describe,"");
				label.width=250;
				label.leading=5;
				label.wordWrap=true;
				curY+=27;
				createLine(10,curY,263);
				curY+=13;
				
				//时效
				createUiAsset("shixiaoxing");
				curY+=17;
				name=HtmlTextUtil.getTextColor(StaticValue.A_UI_GRAY_TEXT,"类别:");
				value=HtmlTextUtil.getTextColor(StaticValue.A_UI_BEIGE_TEXT,"永久");
				createLabel(name,value);
				curY+=27;
				_itemTip.lb3.visible=_itemTip.lbXiuwei.visible=false;
			}
			
			//物品价值
			if (_itemInfo.qItem.q_sell==1) 
			{
				createLine(10,curY,263);
				curY+=13;
				
				createUiAsset("zhuangbeijiazhi");
				curY+=17;
				
				name=HtmlTextUtil.getTextColor(StaticValue.A_UI_GRAY_TEXT,"售价:");
				value=HtmlTextUtil.getTextColor(StaticValue.A_UI_GREEN_TEXT,"    "+_itemInfo.qItem.q_sell_price.toString());
				_itemTip.container.addChild(yinIcon);			
				label=createLabel(name,value);
				yinIcon.x=52;
				yinIcon.y=curY-4;
			}
			else
			{
				MCUtil.removeSelf(yinIcon);
				curY-=27;
			}
			
			for(var i:int=0;i<_itemTip.bg.numChildren;i++){
				_itemTip.bg.getChildAt(i).visible=false;
			}
			var ui_bg:UIAsset=_itemTip.bg.getChildAt(_itemInfo.qItem.q_default) as UIAsset;
			ui_bg.visible=true;
			ui_bg.height=curY;
			_itemTip.bg_di.y=ui_bg.height;
			_itemTip.lbBangding.y=_itemTip.bg_di.y-3;
			_itemTip.bg_di.visible=true;
			_itemTip.bg.height=_itemTip.bg_di.y+_itemTip.bg_di.height;
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
			
			return _itemTip.bg.height;
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
