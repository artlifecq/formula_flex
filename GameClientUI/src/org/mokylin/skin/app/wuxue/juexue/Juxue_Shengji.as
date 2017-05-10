package org.mokylin.skin.app.wuxue.juexue
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.app.wuxue.Title_Skin;
	import org.mokylin.skin.app.wuxue.juexue.Item_shuxing;
	import org.mokylin.skin.app.wuxue.juexue.button.ButtonSj;
	import org.mokylin.skin.app.wuxue.juexue.button.ButtonYingyong;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class Juxue_Shengji extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btn_shengji:feathers.controls.Button;

		public var btn_yinyong:feathers.controls.Button;

		public var currentLevel:feathers.controls.SkinnableContainer;

		public var grp_dengji:feathers.controls.Group;

		public var grp_xiaohao:feathers.controls.Group;

		public var isopen:feathers.controls.UIAsset;

		public var lb_dengji:feathers.controls.Label;

		public var lb_lujing:feathers.controls.Label;

		public var lb_xiaohao:feathers.controls.Label;

		public var nexttLevel:feathers.controls.SkinnableContainer;

		public var tile_1:feathers.controls.SkinnableContainer;

		public var tile_2:feathers.controls.SkinnableContainer;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Juxue_Shengji()
		{
			super();
			
			this.currentState = "normal";
			this.height = 445;
			this.width = 260;
			this.elementsContent = [__Juxue_Shengji_UIAsset1_i(),tile_1_i(),tile_2_i(),grp_dengji_i(),currentLevel_i(),nexttLevel_i(),grp_xiaohao_i(),isopen_i(),btn_shengji_i(),btn_yinyong_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __Juxue_Shengji_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "当前等级：";
			temp.color = 0xBEA757;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 10;
			temp.y = 0;
			return temp;
		}

		private function __Juxue_Shengji_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "升级消耗：";
			temp.color = 0xBEA757;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 10;
			temp.y = 0;
			return temp;
		}

		private function __Juxue_Shengji_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 445;
			temp.styleName = "ui/common/background/neikuang_2.png";
			temp.width = 260;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __Juxue_Shengji_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/wuxue/juexue/diandian.png";
			temp.x = 0;
			temp.y = 5;
			return temp;
		}

		private function __Juxue_Shengji_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/wuxue/juexue/diandian.png";
			temp.x = 0;
			temp.y = 5;
			return temp;
		}

		private function btn_shengji_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_shengji = temp;
			temp.name = "btn_shengji";
			temp.styleClass = org.mokylin.skin.app.wuxue.juexue.button.ButtonSj;
			temp.x = 73;
			temp.y = 332;
			return temp;
		}

		private function btn_yinyong_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_yinyong = temp;
			temp.name = "btn_yinyong";
			temp.styleClass = org.mokylin.skin.app.wuxue.juexue.button.ButtonYingyong;
			temp.x = 72;
			temp.y = 366;
			return temp;
		}

		private function currentLevel_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			currentLevel = temp;
			temp.name = "currentLevel";
			temp.height = 40;
			var skin:StateSkin = new org.mokylin.skin.app.wuxue.juexue.Item_shuxing()
			temp.skin = skin
			temp.width = 235;
			temp.x = 16;
			temp.y = 71;
			return temp;
		}

		private function grp_dengji_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_dengji = temp;
			temp.name = "grp_dengji";
			temp.x = 16;
			temp.y = 38;
			temp.elementsContent = [__Juxue_Shengji_Label1_i(),lb_dengji_i(),__Juxue_Shengji_UIAsset2_i()];
			return temp;
		}

		private function grp_xiaohao_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_xiaohao = temp;
			temp.name = "grp_xiaohao";
			temp.x = 15;
			temp.y = 235;
			temp.elementsContent = [__Juxue_Shengji_Label2_i(),lb_xiaohao_i(),__Juxue_Shengji_UIAsset3_i(),lb_lujing_i()];
			return temp;
		}

		private function isopen_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			isopen = temp;
			temp.name = "isopen";
			temp.styleName = "ui/app/wuxue/juexue/yqyong.png";
			temp.x = 4;
			temp.y = 363;
			return temp;
		}

		private function lb_dengji_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_dengji = temp;
			temp.name = "lb_dengji";
			temp.text = "30/100";
			temp.color = 0x5CB006;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 154;
			temp.x = 80;
			temp.y = 0;
			return temp;
		}

		private function lb_lujing_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_lujing = temp;
			temp.name = "lb_lujing";
			temp.text = "获取路径";
			temp.color = 0x5CB006;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.underline = true;
			temp.x = 172;
			temp.y = 26;
			return temp;
		}

		private function lb_xiaohao_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_xiaohao = temp;
			temp.name = "lb_xiaohao";
			temp.htmlText = "<u>初级技能书*1（1）</u><font color='#5DBD37'></font>";
			temp.color = 0x5CB006;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 154;
			temp.x = 78;
			temp.y = 0;
			return temp;
		}

		private function nexttLevel_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			nexttLevel = temp;
			temp.name = "nexttLevel";
			temp.height = 40;
			var skin:StateSkin = new org.mokylin.skin.app.wuxue.juexue.Item_shuxing()
			temp.skin = skin
			temp.width = 235;
			temp.x = 16;
			temp.y = 116;
			return temp;
		}

		private function tile_1_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			tile_1 = temp;
			temp.name = "tile_1";
			temp.height = 27;
			var skin:StateSkin = new org.mokylin.skin.app.wuxue.Title_Skin()
			temp.skin = skin
			temp.width = 253;
			temp.x = 4;
			temp.y = 4;
			return temp;
		}

		private function tile_2_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			tile_2 = temp;
			temp.name = "tile_2";
			temp.height = 27;
			var skin:StateSkin = new org.mokylin.skin.app.wuxue.Title_Skin()
			temp.skin = skin
			temp.width = 253;
			temp.x = 4;
			temp.y = 197;
			return temp;
		}

	}
}