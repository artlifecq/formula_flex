package org.mokylin.skin.app.activety.shijieboss
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.List;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonSkin_shouhui;
	import org.mokylin.skin.component.button.ButtonSkin_zhankai;
	import org.mokylin.skin.component.list.ListSkin1;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class ShangHaiPaiHang extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var ListItem:feathers.controls.List;

		public var btn_close:feathers.controls.Button;

		public var btn_open:feathers.controls.Button;

		public var contentBox:feathers.controls.Group;

		public var myHurt:feathers.controls.Label;

		public var myRank:feathers.controls.Label;

		public var uiIcon:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function ShangHaiPaiHang()
		{
			super();
			
			this.currentState = "normal";
			this.height = 407;
			this.width = 302;
			this.elementsContent = [contentBox_i(),btn_close_i(),btn_open_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function ListItem_i():feathers.controls.List
		{
			var temp:feathers.controls.List = new feathers.controls.List();
			ListItem = temp;
			temp.name = "ListItem";
			temp.height = 267;
			temp.styleClass = org.mokylin.skin.component.list.ListSkin1;
			temp.width = 295;
			temp.x = 6;
			temp.y = 60;
			return temp;
		}

		private function __ShangHaiPaiHang_Group1_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			temp.x = -23;
			temp.y = 32;
			temp.elementsContent = [__ShangHaiPaiHang_UIAsset7_i(),__ShangHaiPaiHang_Label1_i(),__ShangHaiPaiHang_Label2_i(),__ShangHaiPaiHang_Label3_i(),__ShangHaiPaiHang_Label4_i()];
			return temp;
		}

		private function __ShangHaiPaiHang_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "名次";
			temp.textAlign = "left";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 35;
			temp.x = 28;
			temp.y = 4;
			return temp;
		}

		private function __ShangHaiPaiHang_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "玩家名";
			temp.textAlign = "center";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 104;
			temp.x = 82;
			temp.y = 4;
			return temp;
		}

		private function __ShangHaiPaiHang_Label3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "伤害值";
			temp.textAlign = "left";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 60;
			temp.x = 219;
			temp.y = 4;
			return temp;
		}

		private function __ShangHaiPaiHang_Label4_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "奖励";
			temp.textAlign = "left";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 32;
			temp.x = 290;
			temp.y = 4;
			return temp;
		}

		private function __ShangHaiPaiHang_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 383;
			temp.styleName = "ui/common/background/neikuang_3.png";
			temp.width = 302;
			temp.x = 2;
			temp.y = 1;
			return temp;
		}

		private function __ShangHaiPaiHang_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/activety/shijieboss/bossbg.jpg";
			temp.width = 300;
			temp.x = 4;
			temp.y = 331;
			return temp;
		}

		private function __ShangHaiPaiHang_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/activety/shijieboss/titledi.png";
			temp.x = 2;
			temp.y = 1;
			return temp;
		}

		private function __ShangHaiPaiHang_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/activety/shijieboss/bosspaihang.png";
			temp.x = 39;
			temp.y = 5;
			return temp;
		}

		private function __ShangHaiPaiHang_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/activety/shijieboss/zuihoulyijiwanjia.png";
			temp.x = 40;
			temp.y = 384;
			return temp;
		}

		private function __ShangHaiPaiHang_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/activety/shijieboss/anzke.png";
			temp.x = 40;
			temp.y = 367;
			return temp;
		}

		private function __ShangHaiPaiHang_UIAsset7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/activety/shijieboss/yeqian.png";
			temp.x = 25;
			temp.y = 0;
			return temp;
		}

		private function btn_close_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_close = temp;
			temp.name = "btn_close";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_zhankai;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btn_open_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_open = temp;
			temp.name = "btn_open";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_shouhui;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function contentBox_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			contentBox = temp;
			temp.name = "contentBox";
			temp.height = 408;
			temp.width = 305;
			temp.x = -3;
			temp.y = 0;
			temp.elementsContent = [__ShangHaiPaiHang_UIAsset1_i(),__ShangHaiPaiHang_UIAsset2_i(),__ShangHaiPaiHang_UIAsset3_i(),__ShangHaiPaiHang_UIAsset4_i(),__ShangHaiPaiHang_UIAsset5_i(),__ShangHaiPaiHang_UIAsset6_i(),myHurt_i(),myRank_i(),__ShangHaiPaiHang_Group1_i(),ListItem_i(),uiIcon_i()];
			return temp;
		}

		private function myHurt_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			myHurt = temp;
			temp.name = "myHurt";
			temp.text = "我的伤害：$";
			temp.color = 0xE8C958;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 180;
			temp.x = 10;
			temp.y = 340;
			return temp;
		}

		private function myRank_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			myRank = temp;
			temp.name = "myRank";
			temp.text = "我的排名：$";
			temp.color = 0xE8C958;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 110;
			temp.x = 191;
			temp.y = 340;
			return temp;
		}

		private function uiIcon_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiIcon = temp;
			temp.name = "uiIcon";
			temp.styleName = "ui/app/activety/shijieboss/icon/1.png";
			temp.x = 248;
			temp.y = 376;
			return temp;
		}

	}
}