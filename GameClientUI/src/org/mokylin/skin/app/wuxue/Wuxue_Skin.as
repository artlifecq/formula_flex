package org.mokylin.skin.app.wuxue
{
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.app.wuxue.Wuxue_Daohang;
	import org.mokylin.skin.app.wuxue.jineng.jineng_Skin;
	import org.mokylin.skin.app.wuxue.juexue.Juexue_Skin;
	import org.mokylin.skin.common.yiji_panelbg_Skin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class Wuxue_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.SkinnableContainer;

		public var daohang:feathers.controls.SkinnableContainer;

		public var jineng:feathers.controls.SkinnableContainer;

		public var juexue:feathers.controls.SkinnableContainer;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Wuxue_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 587;
			this.width = 947;
			this.elementsContent = [bg_i(),daohang_i(),jineng_i(),juexue_i(),__Wuxue_Skin_UIAsset1_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __Wuxue_Skin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchable = false;
			temp.touchGroup = true;
			temp.styleName = "ui/app/wuxue/wuxue.png";
			temp.x = 441;
			temp.y = 11;
			return temp;
		}

		private function bg_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			bg = temp;
			temp.name = "bg";
			temp.height = 587;
			var skin:StateSkin = new org.mokylin.skin.common.yiji_panelbg_Skin()
			temp.skin = skin
			temp.width = 947;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function daohang_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			daohang = temp;
			temp.name = "daohang";
			temp.height = 50;
			var skin:StateSkin = new org.mokylin.skin.app.wuxue.Wuxue_Daohang()
			temp.skin = skin
			temp.width = 283;
			temp.x = 20;
			temp.y = 528;
			return temp;
		}

		private function jineng_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			jineng = temp;
			temp.name = "jineng";
			temp.height = 587;
			var skin:StateSkin = new org.mokylin.skin.app.wuxue.jineng.jineng_Skin()
			temp.skin = skin
			temp.width = 947;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function juexue_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			juexue = temp;
			temp.name = "juexue";
			temp.height = 587;
			var skin:StateSkin = new org.mokylin.skin.app.wuxue.juexue.Juexue_Skin()
			temp.skin = skin
			temp.width = 947;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

	}
}