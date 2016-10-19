package org.mokylin.skin.mainui.map.btn
{
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class BtnDituSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var __BtnDituSkin_UIAsset1:feathers.controls.UIAsset;

		public var __BtnDituSkin_UIAsset2:feathers.controls.UIAsset;

		public var __BtnDituSkin_UIAsset3:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function BtnDituSkin()
		{
			super();
			
			this.currentState = "up";
			this.elementsContent = [];
			__BtnDituSkin_UIAsset1_i();
			__BtnDituSkin_UIAsset2_i();
			__BtnDituSkin_UIAsset3_i();
			
			
			states = {
				up:[
						{target:"__BtnDituSkin_UIAsset1",
							propertyName:"",
							position:"last",
							relativeTo:""
						}
					]
				,
				hover:[
						{target:"__BtnDituSkin_UIAsset2",
							propertyName:"",
							position:"last",
							relativeTo:""
						}
					]
				,
				down:[
						{target:"__BtnDituSkin_UIAsset3",
							propertyName:"",
							position:"last",
							relativeTo:""
						}
					]
				,
				init:[
					]
			};
			skinNames={hover:"ylztAssets/hud/mini_map/btn/ditu.png",	up:"ylztAssets/hud/mini_map/btn/ditu.png",	down:"ylztAssets/hud/mini_map/btn/ditu.png"};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __BtnDituSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			__BtnDituSkin_UIAsset1 = temp;
			temp.styleName = "ylztAssets/hud/mini_map/btn/ditu.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __BtnDituSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			__BtnDituSkin_UIAsset2 = temp;
			temp.styleName = "ylztAssets/hud/mini_map/btn/ditu.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __BtnDituSkin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			__BtnDituSkin_UIAsset3 = temp;
			temp.styleName = "ylztAssets/hud/mini_map/btn/ditu.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

	}
}