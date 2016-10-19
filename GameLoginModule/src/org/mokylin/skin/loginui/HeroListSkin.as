package org.mokylin.skin.loginui
{
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class HeroListSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var role1:feathers.controls.UIAsset;

		public var role2:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function HeroListSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 924;
			this.width = 1643;
			this.elementsContent = [role2_i(),role1_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function role1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			role1 = temp;
			temp.name = "role1";
			temp.height = 726;
			temp.styleName = "ui/loginui/loginuiRole/juese_1.png";
			temp.width = 472;
			temp.x = 335;
			temp.y = 155;
			return temp;
		}

		private function role2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			role2 = temp;
			temp.name = "role2";
			temp.height = 726;
			temp.styleName = "ui/loginui/loginuiRole/juese_2.png";
			temp.width = 472;
			temp.x = 675;
			temp.y = 155;
			return temp;
		}

	}
}