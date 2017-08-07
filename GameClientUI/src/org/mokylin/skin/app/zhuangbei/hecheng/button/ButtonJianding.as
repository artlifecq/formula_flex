package org.mokylin.skin.app.zhuangbei.hecheng.button
{
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class ButtonJianding extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var iconDisplay:feathers.controls.UIAsset;

		public var labelDisplay:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function ButtonJianding()
		{
			super();
			
			this.currentState = "upAndSelected";
			this.elementsContent = [];
			
			states = {
			};
			skinNames={"down":"ui/app/zhuangbei/hecheng/button/hechengBase/down.png,ui/app/zhuangbei/hecheng/button/jiandingtuzhihecheng/down.png",
			"downAndSelected":"ui/app/zhuangbei/hecheng/button/hechengBase/over.png,ui/app/zhuangbei/hecheng/button/jiandingtuzhihecheng/down.png,ui/app/zhuangbei/hecheng/button/jiandingtuzhihecheng/up.png",
			"hover":"ui/app/zhuangbei/hecheng/button/hechengBase/over.png,ui/app/zhuangbei/hecheng/button/jiandingtuzhihecheng/up.png,ui/app/zhuangbei/hecheng/button/jiandingtuzhihecheng/down.png",
			"hoverAndSelected":"ui/app/zhuangbei/hecheng/button/hechengBase/over.png,ui/app/zhuangbei/hecheng/button/jiandingtuzhihecheng/up.png,ui/app/zhuangbei/hecheng/button/jiandingtuzhihecheng/down.png",
			"up":"ui/app/zhuangbei/hecheng/button/hechengBase/up.png,ui/app/zhuangbei/hecheng/button/jiandingtuzhihecheng/up.png,ui/app/zhuangbei/hecheng/button/jiandingtuzhihecheng/down.png",
			"upAndSelected":"ui/app/zhuangbei/hecheng/button/hechengBase/over.png,ui/app/zhuangbei/hecheng/button/jiandingtuzhihecheng/down.png,ui/app/zhuangbei/hecheng/button/jiandingtuzhihecheng/up.png"};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function iconDisplay_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			iconDisplay = temp;
			temp.name = "iconDisplay";
			return temp;
		}

		private function labelDisplay_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labelDisplay = temp;
			temp.name = "labelDisplay";
			temp.bottom = 0;
			temp.left = 0;
			temp.right = 0;
			temp.top = 0;
			return temp;
		}

	}
}