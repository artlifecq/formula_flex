package org.mokylin.skin.app.activety.jixiantiaozhan
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
	public class JiXianPaiHang extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var ListItem:feathers.controls.List;

		public var btn_close:feathers.controls.Button;

		public var btn_open:feathers.controls.Button;

		public var container_list:feathers.controls.SkinnableContainer;

		public var contentBox:feathers.controls.Group;

		public var head_left:feathers.controls.UIAsset;

		public var head_right:feathers.controls.UIAsset;

		public var lbHeadName:feathers.controls.Label;

		public var myHurt:feathers.controls.Label;

		public var myRank:feathers.controls.Label;

		public var uiIcon:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function JiXianPaiHang()
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
			temp.visible = false;
			temp.width = 295;
			temp.x = 6;
			temp.y = 60;
			return temp;
		}

		private function __JiXianPaiHang_Group1_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			temp.x = -23;
			temp.y = 32;
			temp.elementsContent = [__JiXianPaiHang_UIAsset5_i(),__JiXianPaiHang_Label2_i(),__JiXianPaiHang_Label3_i(),__JiXianPaiHang_Label4_i(),__JiXianPaiHang_Label5_i()];
			return temp;
		}

		private function __JiXianPaiHang_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "若BOSS未被成功击杀，也将发放参与奖";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 251;
			temp.x = 10;
			temp.y = 361;
			return temp;
		}

		private function __JiXianPaiHang_Label2_i():feathers.controls.Label
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

		private function __JiXianPaiHang_Label3_i():feathers.controls.Label
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

		private function __JiXianPaiHang_Label4_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "伤害值";
			temp.textAlign = "left";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 56;
			temp.x = 223;
			temp.y = 4;
			return temp;
		}

		private function __JiXianPaiHang_Label5_i():feathers.controls.Label
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

		private function __JiXianPaiHang_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 383;
			temp.styleName = "ui/common/background/neikuang_3.png";
			temp.width = 302;
			temp.x = 2;
			temp.y = 1;
			return temp;
		}

		private function __JiXianPaiHang_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/activety/shijieboss/bossbg.jpg";
			temp.x = 4;
			temp.y = 331;
			return temp;
		}

		private function __JiXianPaiHang_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/activety/shijieboss/titledi.png";
			temp.x = 2;
			temp.y = 1;
			return temp;
		}

		private function __JiXianPaiHang_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/activety/shijieboss/zuihoulyijiwanjia.png";
			temp.x = 40;
			temp.y = 384;
			return temp;
		}

		private function __JiXianPaiHang_UIAsset5_i():feathers.controls.UIAsset
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

		private function container_list_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			container_list = temp;
			temp.name = "container_list";
			temp.height = 267;
			temp.width = 295;
			temp.x = 6;
			temp.y = 60;
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
			temp.elementsContent = [__JiXianPaiHang_UIAsset1_i(),__JiXianPaiHang_UIAsset2_i(),__JiXianPaiHang_UIAsset3_i(),lbHeadName_i(),head_left_i(),head_right_i(),__JiXianPaiHang_UIAsset4_i(),__JiXianPaiHang_Label1_i(),myHurt_i(),myRank_i(),__JiXianPaiHang_Group1_i(),ListItem_i(),uiIcon_i(),container_list_i()];
			return temp;
		}

		private function head_left_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			head_left = temp;
			temp.name = "head_left";
			temp.height = 10;
			temp.styleName = "ui/mainui/fubenzhuizong/zs.png";
			temp.width = 45;
			temp.x = 60;
			temp.y = 13;
			return temp;
		}

		private function head_right_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			head_right = temp;
			temp.name = "head_right";
			temp.height = 10;
			temp.scaleX = -1;
			temp.styleName = "ui/mainui/fubenzhuizong/zs.png";
			temp.width = 45;
			temp.x = 258;
			temp.y = 13;
			return temp;
		}

		private function lbHeadName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbHeadName = temp;
			temp.name = "lbHeadName";
			temp.fontSize = 16;
			temp.text = "BOSS伤害排行";
			temp.textAlign = "center";
			temp.color = 0xFFF2B7;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlue"];
			temp.width = 205;
			temp.x = 57;
			temp.y = 7;
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