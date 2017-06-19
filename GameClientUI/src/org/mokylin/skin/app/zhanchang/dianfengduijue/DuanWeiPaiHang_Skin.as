package org.mokylin.skin.app.zhanchang.dianfengduijue
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.app.zhanchang.dianfengduijue.DuanWeiList_Head;
	import org.mokylin.skin.app.zhanchang.dianfengduijue.DuanWeiList_Item;
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
		public var bg:feathers.controls.UIAsset;

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

		public var title:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function DuanWeiPaiHang_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 411;
			this.width = 580;
			this.elementsContent = [bg_i(),title_i(),btnClose_i(),skinDuan1_i(),skinDuan2_i(),skinDuan3_i(),skinDuan4_i(),skinDuan5_i(),skinItem1_i(),skinItem2_i(),skinItem3_i(),skinItem4_i(),skinItem5_i(),__DuanWeiPaiHang_Skin_Group1_i()];
			
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
			temp.elementsContent = [__DuanWeiPaiHang_Skin_UIAsset1_i(),__DuanWeiPaiHang_Skin_Label1_i(),__DuanWeiPaiHang_Skin_Label2_i(),__DuanWeiPaiHang_Skin_Label3_i()];
			return temp;
		}

		private function __DuanWeiPaiHang_Skin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "排名";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 35;
			temp.y = 4;
			return temp;
		}

		private function __DuanWeiPaiHang_Skin_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "段位声望奖励";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 187;
			temp.y = 4;
			return temp;
		}

		private function __DuanWeiPaiHang_Skin_Label3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "升阶积分";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 379;
			temp.y = 4;
			return temp;
		}

		private function __DuanWeiPaiHang_Skin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhanchang/dianfengduijue/yeqianlan.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function bg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg = temp;
			temp.name = "bg";
			temp.height = 411;
			temp.styleName = "ui/common/background/erji_kuang.png";
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
			temp.x = 11;
			temp.y = 37;
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
			temp.x = 11;
			temp.y = 110;
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
			temp.x = 11;
			temp.y = 183;
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
			temp.x = 11;
			temp.y = 256;
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
			temp.x = 11;
			temp.y = 329;
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

		private function title_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			title = temp;
			temp.name = "title";
			temp.bold = true;
			temp.touchable = false;
			temp.touchGroup = true;
			temp.letterSpacing = 2;
			temp.fontSize = 16;
			temp.text = "跨服竞技段位表";
			temp.textAlign = "center";
			temp.color = 0xDDE2B1;
			temp.nativeFilters = Fontter.filterObj[""];
			temp.width = 240;
			temp.x = 170;
			temp.y = 11;
			return temp;
		}

	}
}