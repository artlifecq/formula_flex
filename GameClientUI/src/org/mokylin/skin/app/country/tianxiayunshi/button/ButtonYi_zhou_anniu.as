package org.mokylin.skin.app.country.tianxiayunshi.button
{
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class ButtonYi_zhou_anniu extends feathers.controls.StateSkin
	{
		public var iconDisplay:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function ButtonYi_zhou_anniu()
		{
			super();
			
			this.currentState = "overAndSelected";
			this.elementsContent = [];
			
			states = {
			};
			skinNames={"down":"ui/app/country/tianxiayunshi/button/yi_zhou_anniu/down.png",
			"downAndSelected":"ui/app/country/tianxiayunshi/button/yi_zhou_anniu/over.png",
			"hover":"ui/app/country/tianxiayunshi/button/yi_zhou_anniu/over.png",
			"overAndSelected":"ui/app/country/tianxiayunshi/button/yi_zhou_anniu/over.png",
			"up":"ui/app/country/tianxiayunshi/button/yi_zhou_anniu/up.png",
			"upAndSelected":"ui/app/country/tianxiayunshi/button/yi_zhou_anniu/over.png"};
		}


		private function iconDisplay_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			iconDisplay = temp;
			temp.name = "iconDisplay";
			return temp;
		}

	}
}