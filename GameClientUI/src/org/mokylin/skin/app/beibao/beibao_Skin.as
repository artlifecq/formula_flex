package org.mokylin.skin.app.beibao
{
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import org.mokylin.skin.app.beibao.daohang_Skin;
	import org.mokylin.skin.app.beibao.juese_Skin;
	import org.mokylin.skin.app.jineng.jineng_Skin;
	import org.mokylin.skin.common.yiji_panelbg_Skin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class beibao_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.SkinnableContainer;

		public var daohang:feathers.controls.SkinnableContainer;

		public var jineng:feathers.controls.SkinnableContainer;

		public var juese:feathers.controls.SkinnableContainer;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function beibao_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 587;
			this.width = 947;
			this.elementsContent = [bg_i(),juese_i(),daohang_i(),jineng_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
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
			var skin:StateSkin = new org.mokylin.skin.app.beibao.daohang_Skin()
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
			var skin:StateSkin = new org.mokylin.skin.app.jineng.jineng_Skin()
			temp.skin = skin
			temp.width = 947;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function juese_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			juese = temp;
			temp.name = "juese";
			temp.height = 587;
			var skin:StateSkin = new org.mokylin.skin.app.beibao.juese_Skin()
			temp.skin = skin
			temp.width = 947;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

	}
}