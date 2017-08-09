package org.mokylin.skin.app.zhanchang.dianfengduijue
{
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.app.zhanchang.dianfengduijue.DuanWeiList_Head;
	import org.mokylin.skin.app.zhanchang.dianfengduijue.DuanWeiList_Item;
	import org.mokylin.skin.common.TongYongTanKuang_bg2;
	import org.mokylin.skin.component.button.ButtonSkin_close;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class DuanWeiPaiHang_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.SkinnableContainer;

		public var btnClose:feathers.controls.Button;

		public var skinDuan1:feathers.controls.SkinnableContainer;

		public var skinDuan2:feathers.controls.SkinnableContainer;

		public var skinDuan3:feathers.controls.SkinnableContainer;

		public var skinDuan4:feathers.controls.SkinnableContainer;

		public var skinDuan5:feathers.controls.SkinnableContainer;

		public var skinItem1:feathers.controls.SkinnableContainer;

		public var skinItem2:feathers.controls.SkinnableContainer;

		public var skinItem3:feathers.controls.SkinnableContainer;

		public var skinItem4:feathers.controls.SkinnableContainer;

		public var skinItem5:feathers.controls.SkinnableContainer;

		public var title:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function DuanWeiPaiHang_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 411;
			this.width = 580;
			this.elementsContent = [bg_i(),__DuanWeiPaiHang_Skin_UIAsset1_i(),btnClose_i(),skinDuan1_i(),skinDuan2_i(),skinDuan3_i(),skinDuan4_i(),skinDuan5_i(),skinItem1_i(),skinItem2_i(),skinItem3_i(),skinItem4_i(),skinItem5_i(),__DuanWeiPaiHang_Skin_Group1_i(),title_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __DuanWeiPaiHang_Skin_Group1_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			temp.x = 100;
			temp.y = 41;
			temp.elementsContent = [__DuanWeiPaiHang_Skin_UIAsset2_i(),__DuanWeiPaiHang_Skin_UIAsset3_i(),__DuanWeiPaiHang_Skin_UIAsset4_i(),__DuanWeiPaiHang_Skin_UIAsset5_i(),__DuanWeiPaiHang_Skin_UIAsset6_i(),__DuanWeiPaiHang_Skin_UIAsset7_i()];
			return temp;
		}

		private function __DuanWeiPaiHang_Skin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 368;
			temp.styleName = "ui/common/background/neikuang_2.png";
			temp.width = 474;
			temp.x = 98;
			temp.y = 37;
			return temp;
		}

		private function __DuanWeiPaiHang_Skin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/component/tabbar/fenye/erjibiaoqian.png";
			temp.width = 103;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __DuanWeiPaiHang_Skin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/component/tabbar/fenye/erjibiaoqian.png";
			temp.width = 244;
			temp.x = 104;
			temp.y = 0;
			return temp;
		}

		private function __DuanWeiPaiHang_Skin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/component/tabbar/fenye/erjibiaoqian.png";
			temp.width = 121;
			temp.x = 348;
			temp.y = 0;
			return temp;
		}

		private function __DuanWeiPaiHang_Skin_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhanchang/paiming.png";
			temp.x = 38;
			temp.y = 5;
			return temp;
		}

		private function __DuanWeiPaiHang_Skin_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhanchang/duanweishengwangjiangli.png";
			temp.x = 170;
			temp.y = 5;
			return temp;
		}

		private function __DuanWeiPaiHang_Skin_UIAsset7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhanchang/shengjiejifen.png";
			temp.x = 366;
			temp.y = 5;
			return temp;
		}

		private function bg_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			bg = temp;
			temp.name = "bg";
			temp.height = 411;
			var skin:StateSkin = new org.mokylin.skin.common.TongYongTanKuang_bg2()
			temp.skin = skin
			temp.width = 580;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btnClose_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnClose = temp;
			temp.name = "btnClose";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_close;
			temp.x = 545;
			temp.y = 7;
			return temp;
		}

		private function skinDuan1_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			skinDuan1 = temp;
			temp.name = "skinDuan1";
			temp.height = 72;
			var skin:StateSkin = new org.mokylin.skin.app.zhanchang.dianfengduijue.DuanWeiList_Head()
			temp.skin = skin
			temp.width = 85;
			temp.x = 12;
			temp.y = 38;
			return temp;
		}

		private function skinDuan2_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			skinDuan2 = temp;
			temp.name = "skinDuan2";
			temp.height = 72;
			var skin:StateSkin = new org.mokylin.skin.app.zhanchang.dianfengduijue.DuanWeiList_Head()
			temp.skin = skin
			temp.width = 85;
			temp.x = 12;
			temp.y = 112;
			return temp;
		}

		private function skinDuan3_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			skinDuan3 = temp;
			temp.name = "skinDuan3";
			temp.height = 72;
			var skin:StateSkin = new org.mokylin.skin.app.zhanchang.dianfengduijue.DuanWeiList_Head()
			temp.skin = skin
			temp.width = 85;
			temp.x = 12;
			temp.y = 185;
			return temp;
		}

		private function skinDuan4_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			skinDuan4 = temp;
			temp.name = "skinDuan4";
			temp.height = 72;
			var skin:StateSkin = new org.mokylin.skin.app.zhanchang.dianfengduijue.DuanWeiList_Head()
			temp.skin = skin
			temp.width = 85;
			temp.x = 12;
			temp.y = 259;
			return temp;
		}

		private function skinDuan5_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			skinDuan5 = temp;
			temp.name = "skinDuan5";
			temp.height = 72;
			var skin:StateSkin = new org.mokylin.skin.app.zhanchang.dianfengduijue.DuanWeiList_Head()
			temp.skin = skin
			temp.width = 85;
			temp.x = 12;
			temp.y = 332;
			return temp;
		}

		private function skinItem1_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			skinItem1 = temp;
			temp.name = "skinItem1";
			temp.height = 66;
			var skin:StateSkin = new org.mokylin.skin.app.zhanchang.dianfengduijue.DuanWeiList_Item()
			temp.skin = skin
			temp.width = 468;
			temp.x = 100;
			temp.y = 67;
			return temp;
		}

		private function skinItem2_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			skinItem2 = temp;
			temp.name = "skinItem2";
			temp.height = 66;
			var skin:StateSkin = new org.mokylin.skin.app.zhanchang.dianfengduijue.DuanWeiList_Item()
			temp.skin = skin
			temp.width = 468;
			temp.x = 100;
			temp.y = 133;
			return temp;
		}

		private function skinItem3_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			skinItem3 = temp;
			temp.name = "skinItem3";
			temp.height = 66;
			var skin:StateSkin = new org.mokylin.skin.app.zhanchang.dianfengduijue.DuanWeiList_Item()
			temp.skin = skin
			temp.width = 468;
			temp.x = 100;
			temp.y = 199;
			return temp;
		}

		private function skinItem4_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			skinItem4 = temp;
			temp.name = "skinItem4";
			temp.height = 66;
			var skin:StateSkin = new org.mokylin.skin.app.zhanchang.dianfengduijue.DuanWeiList_Item()
			temp.skin = skin
			temp.width = 468;
			temp.x = 100;
			temp.y = 265;
			return temp;
		}

		private function skinItem5_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			skinItem5 = temp;
			temp.name = "skinItem5";
			temp.height = 66;
			var skin:StateSkin = new org.mokylin.skin.app.zhanchang.dianfengduijue.DuanWeiList_Item()
			temp.skin = skin
			temp.width = 468;
			temp.x = 100;
			temp.y = 331;
			return temp;
		}

		private function title_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			title = temp;
			temp.name = "title";
			temp.touchable = false;
			temp.touchGroup = true;
			temp.styleName = "ui/app/zhanchang/kuafujingjiduanweibiao.png";
			temp.x = 212;
			temp.y = 7;
			return temp;
		}

	}
}