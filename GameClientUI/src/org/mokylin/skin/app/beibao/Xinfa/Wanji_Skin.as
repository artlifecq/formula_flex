package org.mokylin.skin.app.beibao.Xinfa
{
	import feathers.controls.Group;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.app.beibao.Xinfa.XinfaIconSkin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class Wanji_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var grp_icondi:feathers.controls.Group;

		public var icd_1:feathers.controls.SkinnableContainer;

		public var icd_10:feathers.controls.SkinnableContainer;

		public var icd_11:feathers.controls.SkinnableContainer;

		public var icd_2:feathers.controls.SkinnableContainer;

		public var icd_3:feathers.controls.SkinnableContainer;

		public var icd_4:feathers.controls.SkinnableContainer;

		public var icd_5:feathers.controls.SkinnableContainer;

		public var icd_6:feathers.controls.SkinnableContainer;

		public var icd_7:feathers.controls.SkinnableContainer;

		public var icd_8:feathers.controls.SkinnableContainer;

		public var icd_9:feathers.controls.SkinnableContainer;

		public var ico_xinfa:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Wanji_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [grp_icondi_i(),ico_xinfa_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function grp_icondi_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_icondi = temp;
			temp.name = "grp_icondi";
			temp.x = 0;
			temp.y = 0;
			temp.elementsContent = [icd_1_i(),icd_2_i(),icd_3_i(),icd_4_i(),icd_5_i(),icd_6_i(),icd_7_i(),icd_8_i(),icd_9_i(),icd_10_i(),icd_11_i()];
			return temp;
		}

		private function icd_10_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			icd_10 = temp;
			temp.name = "icd_10";
			temp.height = 48;
			var skin:StateSkin = new org.mokylin.skin.app.beibao.Xinfa.XinfaIconSkin()
			temp.skin = skin
			temp.width = 48;
			temp.x = 39;
			temp.y = 208;
			return temp;
		}

		private function icd_11_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			icd_11 = temp;
			temp.name = "icd_11";
			temp.height = 48;
			var skin:StateSkin = new org.mokylin.skin.app.beibao.Xinfa.XinfaIconSkin()
			temp.skin = skin
			temp.width = 48;
			temp.x = 73;
			temp.y = 173;
			return temp;
		}

		private function icd_1_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			icd_1 = temp;
			temp.name = "icd_1";
			temp.height = 48;
			var skin:StateSkin = new org.mokylin.skin.app.beibao.Xinfa.XinfaIconSkin()
			temp.skin = skin
			temp.width = 48;
			temp.x = 173;
			temp.y = 173;
			return temp;
		}

		private function icd_2_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			icd_2 = temp;
			temp.name = "icd_2";
			temp.height = 48;
			var skin:StateSkin = new org.mokylin.skin.app.beibao.Xinfa.XinfaIconSkin()
			temp.skin = skin
			temp.width = 48;
			temp.x = 207;
			temp.y = 208;
			return temp;
		}

		private function icd_3_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			icd_3 = temp;
			temp.name = "icd_3";
			temp.height = 48;
			var skin:StateSkin = new org.mokylin.skin.app.beibao.Xinfa.XinfaIconSkin()
			temp.skin = skin
			temp.width = 48;
			temp.x = 246;
			temp.y = 123;
			return temp;
		}

		private function icd_4_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			icd_4 = temp;
			temp.name = "icd_4";
			temp.height = 48;
			var skin:StateSkin = new org.mokylin.skin.app.beibao.Xinfa.XinfaIconSkin()
			temp.skin = skin
			temp.width = 48;
			temp.x = 207;
			temp.y = 35;
			return temp;
		}

		private function icd_5_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			icd_5 = temp;
			temp.name = "icd_5";
			temp.height = 48;
			var skin:StateSkin = new org.mokylin.skin.app.beibao.Xinfa.XinfaIconSkin()
			temp.skin = skin
			temp.width = 48;
			temp.x = 173;
			temp.y = 73;
			return temp;
		}

		private function icd_6_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			icd_6 = temp;
			temp.name = "icd_6";
			temp.height = 48;
			var skin:StateSkin = new org.mokylin.skin.app.beibao.Xinfa.XinfaIconSkin()
			temp.skin = skin
			temp.width = 48;
			temp.x = 123;
			temp.y = 0;
			return temp;
		}

		private function icd_7_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			icd_7 = temp;
			temp.name = "icd_7";
			temp.height = 48;
			var skin:StateSkin = new org.mokylin.skin.app.beibao.Xinfa.XinfaIconSkin()
			temp.skin = skin
			temp.width = 48;
			temp.x = 39;
			temp.y = 35;
			return temp;
		}

		private function icd_8_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			icd_8 = temp;
			temp.name = "icd_8";
			temp.height = 48;
			var skin:StateSkin = new org.mokylin.skin.app.beibao.Xinfa.XinfaIconSkin()
			temp.skin = skin
			temp.width = 48;
			temp.x = 73;
			temp.y = 73;
			return temp;
		}

		private function icd_9_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			icd_9 = temp;
			temp.name = "icd_9";
			temp.height = 48;
			var skin:StateSkin = new org.mokylin.skin.app.beibao.Xinfa.XinfaIconSkin()
			temp.skin = skin
			temp.width = 48;
			temp.x = 0;
			temp.y = 123;
			return temp;
		}

		private function ico_xinfa_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			ico_xinfa = temp;
			temp.name = "ico_xinfa";
			temp.styleName = "ui/app/beibao/xinfa/daojukuang.png";
			temp.x = 112;
			temp.y = 110;
			return temp;
		}

	}
}