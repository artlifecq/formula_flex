package com.rpgGame.appModule.equip
{
	import com.gameClient.utils.JSONUtil;
	import com.rpgGame.app.manager.goods.BackPackManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.sender.ItemSender;
	import com.rpgGame.app.view.icon.BgIcon;
	import com.rpgGame.app.view.icon.DragDropItem;
	import com.rpgGame.appModule.common.ViewUI;
	import com.rpgGame.appModule.common.itemRender.GridItemRender;
	import com.rpgGame.appModule.common.itemRender.HeChengItem;
	import com.rpgGame.appModule.common.itemRender.HeChengItemRender;
	import com.rpgGame.appModule.common.itemRender.SkinItem;
	import com.rpgGame.appModule.common.itemRender.SkinItemRender;
	import com.rpgGame.appModule.friend.view.FriendHeadRender;
	import com.rpgGame.appModule.friend.view.FriendListItemRenderer;
	import com.rpgGame.core.events.ItemEvent;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.cfg.HeChengData;
	import com.rpgGame.coreData.cfg.item.ItemContainerID;
	import com.rpgGame.coreData.clientConfig.Q_hecheng;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.info.item.GridInfo;
	import com.rpgGame.coreData.type.CharAttributeType;
	import com.rpgGame.coreData.type.item.GridBGType;
	import com.rpgGame.coreData.utils.HtmlTextUtil;
	import com.rpgGame.netData.equip.message.ResEquipOperateResultMessage;
	
	import feathers.controls.Button;
	import feathers.controls.GroupedTree;
	import feathers.controls.List;
	import feathers.controls.Scroller;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import feathers.data.ListCollection;
	import feathers.themes.GuiThemeStyle;
	import feathers.utils.filter.GrayFilter;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.app.zhuangbei.hecheng.HeCheng_Skin;
	import org.mokylin.skin.app.zhuangbei.hecheng.button.ButtonHecheng;
	import org.mokylin.skin.app.zhuangbei.qianghua.ListItem_Skin;
	import org.mokylin.skin.component.list.ListSkin1;
	
	import starling.display.DisplayObject;
	import starling.events.Event;
	
	/**
	 *装备合成
	 *@author dik
	 *2017-4-11下午8:05:55
	 */
	public class EquipComboUI extends ViewUI
	{
		private var _skin:HeCheng_Skin;
		
		private const CAILIAO_NUM:int=3;
		
		private var icon:BgIcon;
		private var _cailiao:Vector.<BgIcon>;
		//合成连接线
		private var _exisList:Vector.<UIAsset>;
		//合成数量
		private var _hechengNum:int=1;
		//能合成的最大数量
		private var _hechengMaxNum:int=1;
		//合成需要消耗的元宝单价
		private var _useGold:int=0;
		//合成需要消耗的银两单价
		private var _useMoney:int=0;
		private var tree:GroupedTree;	
		private var _nowSelect:Q_hecheng;
		
		public function EquipComboUI()
		{
			_skin=new HeCheng_Skin();
			super(_skin);
			initListBtn();
			initView();
		}
		//初始化左边按钮
		private var btn:Button;
		private function initListBtn():void
		{
			_skin.list_Item.touchAcross=true;
			_skin.list_Item.itemRendererFactory = createHeChengItemRender;
			_skin.list_Item.clipContent = true;
			_skin.list_Item.scrollBarDisplayMode = "fixed";
			//			_skin.list_Item.verticalScrollBarPosition = "right"
			_skin.list_Item.horizontalScrollPolicy = Scroller.SCROLL_POLICY_OFF;
			_skin.list_Item.verticalScrollPolicy = Scroller.SCROLL_POLICY_AUTO;
			_skin.list_Item.padding=1;
			_skin.list_Item.dataProvider=new ListCollection(HeChengData.getTypeLiet());
			_skin.list_Item.selectedIndex=0;
		}
		
		private function createHeChengItemRender():HeChengItemRender
		{
			var render:HeChengItemRender=new HeChengItemRender();
			return render;
		}
		
		private function initView():void
		{
			_cailiao=new Vector.<BgIcon>();
			_exisList=new Vector.<UIAsset>();
			icon=new BgIcon(IcoSizeEnum.ICON_64);
			icon.x=572;
			icon.y=175;
			icon.touchable=false;
			_exisList.push(_skin.exist1);
			_exisList.push(_skin.exist2);
			_exisList.push(_skin.exist3);
			_skin.container.addChild(icon);
			
			for(var i:int=0;i<CAILIAO_NUM;i++)
			{
				var ico:BgIcon=new BgIcon(IcoSizeEnum.ICON_48);			
				//				ico.setIconResName(ClientConfig.getItemIcon("1001",IcoSizeEnum.ICON_48));
				var uias:UIAsset=_skin.grp_cailiao.getChildByName("cailiao"+(i+1)) as UIAsset;
				uias.addChild(ico);
				ico.x=ico.y=0;
				_cailiao.push(ico);
			}
			
			clearPanel();
		}
		
		override public function show():void
		{
			super.show();
			initEvent();
		}
		
		override public function hide():void
		{
			super.hide();
			clearEvent();
			clearAll();
		}
		
		//显示合成的对象
		private function setShowData():void
		{
			if(!_nowSelect) return;
			_useGold=_nowSelect.q_gold;
			_useMoney=_nowSelect.q_money;
			icon.setIconResName(ClientConfig.getItemIcon(_nowSelect.q_item_id.toString(),IcoSizeEnum.ICON_64));		
			setCaiLiaoData();
		}
		
		//显示或者更新材料显示
		private function setCaiLiaoData():void
		{
			clearPanel();
			if(!_nowSelect) return;
			var cailiao:Array=JSONUtil.decode(_nowSelect.q_cost_items);
			if(cailiao==null) return;
			var cailiaoId:int=parseInt(cailiao[0]);
			var cailiaoNum:int=parseInt(cailiao[1]);
			var itemByBagNum:int=BackPackManager.instance.getBagItemsCountById(cailiaoId);
			_hechengMaxNum=itemByBagNum/cailiaoNum;
			if(itemByBagNum>=cailiaoNum)
			{
				_skin.existall.visible=true;
				_skin.btn_hecheng.filter=null;
			}
			else
			{
				for(var i:int=0;i<_exisList.length;i++)
				{
					_exisList[i].visible=(itemByBagNum>i);
				}
				GrayFilter.gray(_skin.btn_hecheng);
			}
			for(i=0;i<_cailiao.length;i++)
			{
				_cailiao[i].setIconResName(ClientConfig.getItemIcon(cailiaoId.toString(),IcoSizeEnum.ICON_48));	
				if(itemByBagNum>i)
				{
					_cailiao[i].filter=null;					
				}else{
					GrayFilter.gray(_cailiao[i]);
				}					
			}
		}
		
		private function updateShowNum():void
		{
			_skin.input_txt.text=_hechengNum.toString();
			_skin.lb_msg.htmlText=getTitleText("合成消耗");
		}
		
		private function initEvent():void
		{
			_skin.btn_min.addEventListener(Event.TRIGGERED,btnminHandler);
			_skin.btn_max.addEventListener(Event.TRIGGERED,btnmaxHandler);
			_skin.btnMax.addEventListener(Event.TRIGGERED,btnTomaxHandler);
			_skin.btn_hecheng.addEventListener(Event.TRIGGERED,btnHeChengHandler);
			
			EventManager.addEvent(ItemEvent.ITEM_STRENGTH_MSG,updateHechengHandler);
			EventManager.addEvent(ItemEvent.ITEM_HECHENG_SELECT,updateHechengHandler);
		}
		
		private function clearEvent():void
		{
			_skin.btn_min.removeEventListener(Event.TRIGGERED,btnminHandler);
			_skin.btn_max.removeEventListener(Event.TRIGGERED,btnmaxHandler);
			_skin.btnMax.removeEventListener(Event.TRIGGERED,btnTomaxHandler);
			_skin.btn_hecheng.removeEventListener(Event.TRIGGERED,btnHeChengHandler);
			
			EventManager.removeEvent(ItemEvent.ITEM_STRENGTH_MSG,updateHechengHandler);
		}
		
		private function clearPanel():void
		{
			for(var i:int=0;i<_exisList.length;i++)
			{
				_exisList[i].visible=false;
			}
			_skin.existall.visible=false;
			_hechengNum=1;
			updateShowNum();
		}
		
		private function clearAll():void
		{
			for(var i:int=0;i<_cailiao.length;i++)
			{
				_cailiao[i].clear();				
			}
			icon.clear();
			clearPanel();
		}
		
		//显示金钱的消耗数量
		private function getTitleText(title:String):String
		{
			var des:String="";
			var userGold:int=MainRoleManager.actorInfo.totalStat.getResData(CharAttributeType.RES_GOLD);
			var userMoney:int=MainRoleManager.actorInfo.totalStat.getResData(CharAttributeType.RES_MONEY);
			if(_useGold*_hechengNum!=0&&_useGold*_hechengNum<=userGold){
				des=HtmlTextUtil.getTextColor(0x55BD15,(_useGold*_hechengNum).toString()+"元宝");//绿色
			}else if(_useGold*_hechengNum!=0&&_useGold*_hechengNum>userGold){
				des=HtmlTextUtil.getTextColor(0xd02525,(_useGold*_hechengNum).toString()+"元宝");//红色
			}
			if(_useMoney*_hechengNum!=0&&_useMoney*_hechengNum<=userMoney){
				des+=HtmlTextUtil.getTextColor(0x55BD15,(_useMoney*_hechengNum).toString()+"银两");//绿色
			}else if(_useMoney*_hechengNum!=0&&_useMoney*_hechengNum>userMoney){
				des+=HtmlTextUtil.getTextColor(0xd02525,(_useMoney*_hechengNum).toString()+"银两");//红色
			}
			return title+":"+des;
		}
		
		/**合成减*/
		private function btnminHandler(e:Event):void
		{
			if(_hechengNum>1)
			{
				_hechengNum--;
				updateShowNum();
			}
		}
		
		/**合成加*/
		private function btnmaxHandler(e:Event):void
		{
			if(_hechengNum<_hechengMaxNum)
			{
				_hechengNum++;
				updateShowNum();
			}		
		}
		
		/**合成最大数量*/
		private function btnTomaxHandler(e:Event):void
		{
			if(_hechengNum!=_hechengMaxNum)
			{
				_hechengNum=_hechengMaxNum;
				if(_hechengNum==0) _hechengNum=1;
				updateShowNum();
			}
		}
		
		/**合成请求*/
		private function btnHeChengHandler(e:Event):void
		{
			if(!_nowSelect) return;
			var cailiao:Array=JSONUtil.decode(_nowSelect.q_cost_items);
			if(cailiao==null) return;
			var cailiaoId:int=parseInt(cailiao[0]);
			var cailiaoNum:int=parseInt(cailiao[1]);
			var itemByBagNum:int=BackPackManager.instance.getBagItemsCountById(cailiaoId);
			if(itemByBagNum<cailiaoNum)
			{
				//提示材料不足
				
				return;
			}else if(_useGold*_hechengNum!=0&&_useGold*_hechengNum>MainRoleManager.actorInfo.totalStat.getResData(CharAttributeType.RES_GOLD))
			{
				//提示元宝不足
				
				return;
			}else if(_useMoney*_hechengNum!=0&&_useMoney*_hechengNum>MainRoleManager.actorInfo.totalStat.getResData(CharAttributeType.RES_MONEY)){
				//提示银两不足
				
				return;
			}
			//			ItemSender.reqItemCompositionMessage(1,_nowSelect.q_id,_hechengNum);
		}
		
		/**合成结果反馈*/
		private function updateHechengHandler(msg:ResEquipOperateResultMessage):void
		{
			if(msg.opaque==1&&msg.result==1)
			{
				setCaiLiaoData();
			}
		}
		
		private function setSelectItem(mod:Q_hecheng):void
		{
			if(_nowSelect.q_subson_type==mod.q_subson_type) return;
			setShowData();
		}
	}
}