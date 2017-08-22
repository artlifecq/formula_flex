package org.mokylin.skin.app.jianghu.lunjian
{
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class NameItemSelect extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var __NameItemSelect_UIAsset1:feathers.controls.UIAsset;

		public var __NameItemSelect_UIAsset2:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function NameItemSelect()
		{
			super();
			
			this.currentState = "up";
			this.height = 31;
			this.width = 141;
			this.elementsContent = [];
			__NameItemSelect_UIAsset1_i();
			__NameItemSelect_UIAsset2_i();
			
			
			states = {
				disabled:[
						{target:"__NameItemSelect_UIAsset1",
							name:"width",
							value:146
						}
						,
						{target:"__NameItemSelect_UIAsset1",
							name:"height",
							value:29
						}
					]
				,
				up:[
						{target:"__NameItemSelect_UIAsset1",
							name:"width",
							value:146
						}
						,
						{target:"__NameItemSelect_UIAsset1",
							name:"height",
							value:29
						}
					]
			};
			skinNames={"down":"ui/app/jianghu/lunjian/tiaoliang.png",
			"downAndSelected":"ui/app/jianghu/lunjian/tiaoliang.png",
			"hover":"ui/app/jianghu/lunjian/tiaoliang.png",
			"overAndSelected":"ui/app/jianghu/lunjian/tiaoliang.png",
			"up":"ui/common/hover/xuanqukuang2_alpha.png",
			"upAndSelected":"ui/app/jianghu/lunjian/tiaoliang.png"};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __NameItemSelect_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			__NameItemSelect_UIAsset1 = temp;
			temp.height = 31;
			temp.styleName = "ui/app/jianghu/lunjian/tiaoliang.png";
			temp.top = 0;
			temp.width = 141;
			temp.x = 0;
			return temp;
		}

		private function __NameItemSelect_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			__NameItemSelect_UIAsset2 = temp;
			temp.height = 31;
			temp.styleName = "ui/common/hover/xuanqukuang2_alpha.png";
			temp.width = 141;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

	}
}