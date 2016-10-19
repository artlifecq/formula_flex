package org.mokylin.skin.component.button
{
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class BottunSkin_reflesh extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var __BottunSkin_reflesh_UIAsset1:feathers.controls.UIAsset;

		public var __BottunSkin_reflesh_UIAsset2:feathers.controls.UIAsset;

		public var __BottunSkin_reflesh_UIAsset3:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function BottunSkin_reflesh()
		{
			super();
			
			this.currentState = "up";
			this.elementsContent = [];
			__BottunSkin_reflesh_UIAsset1_i();
			__BottunSkin_reflesh_UIAsset2_i();
			__BottunSkin_reflesh_UIAsset3_i();
			
			
			states = {
				up:[
						{target:"__BottunSkin_reflesh_UIAsset3",
							propertyName:"",
							position:"last",
							relativeTo:""
						}
					]
				,
				hover:[
						{target:"__BottunSkin_reflesh_UIAsset2",
							propertyName:"",
							position:"last",
							relativeTo:""
						}
					]
				,
				down:[
						{target:"__BottunSkin_reflesh_UIAsset1",
							propertyName:"",
							position:"last",
							relativeTo:""
						}
					]
				,
				disabled:[
					]
				,
				init:[
					]
			};
			skinNames={up:"ui/component/button/skin_reflesh/up.png",	down:"ui/component/button/skin_reflesh/down.png",	hover:"ui/component/button/skin_reflesh/over.png"};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __BottunSkin_reflesh_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			__BottunSkin_reflesh_UIAsset1 = temp;
			temp.styleName = "ui/component/button/skin_reflesh/down.png";
			return temp;
		}

		private function __BottunSkin_reflesh_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			__BottunSkin_reflesh_UIAsset2 = temp;
			temp.styleName = "ui/component/button/skin_reflesh/over.png";
			return temp;
		}

		private function __BottunSkin_reflesh_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			__BottunSkin_reflesh_UIAsset3 = temp;
			temp.styleName = "ui/component/button/skin_reflesh/up.png";
			return temp;
		}

	}
}