<%@ page language="java" pageEncoding="UTF-8"%>

<title>评价回复管理</title>
<div class="bg-light lter b-b wrapper-md">
  <h1 class="m-n font-thin h3">评价回复管理</h1>
</div>
<div class="wrapper-md">
  <div class="panel panel-default">
    <div class="panel-heading">评价回复列表</div>
    <div class="row wrapper">
      <div class="col-sm-5 m-b-xs">
       <select class="input-sm form-control w-sm inline v-middle">
          <option value="0">全部</option>
          <option value="1">电器</option>
          <option value="2">男装</option>
        </select>   
        <button class="btn btn-sm btn-primary btn-addon"><i class="fa fa-plus"></i>添加</button>         
      </div>
      <div class="col-sm-4">
      </div>
      <div class="col-sm-3">
        <div class="input-group">
          <input type="text" class="input-sm form-control" placeholder="请输入内容">
          <span class="input-group-btn">
            <button class="btn btn-sm btn-icon btn-success"><i class="glyphicon glyphicon-search"></i></button>
          </span>
        </div>
      </div>
    </div>
    <div class="table-responsive">
      <table class="table table-striped b-t b-light">
        <thead>
          <tr>
          	<th style="width:20px;">
              <label class="i-checks m-b-none">
                <input type="checkbox"><i></i>
              </label>
            </th>
            <th style="width:10%">评价回复编号</th>
            <th style="width:30%">评价回复内容</th>
            <th style="width:20%">评价回复时间</th>
            <th style="width:10%">评价编号</th>
           	<th style="width:15%">操作</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td style="width:20px;">
              <label class="i-checks m-b-none">
                <input type="checkbox"><i></i>
              </label>
            </td>
            <td>r1</td>
            <td>r2</td>
            <td>r3</td>
            <td>r4</td>
            <td>
              <button class="btn btn-sm btn-icon btn-info"><i class="glyphicon glyphicon-pencil"></i></button>
              <button class="btn btn-sm btn-icon btn-danger"><i class="glyphicon glyphicon-trash"></i></button>
            </td>
          </tr>
          
        </tbody>       
        <tbody id="tableTbody"></tbody>
      </table>
    </div>
    <footer class="panel-footer">
      <div class="row">
        <div class="col-sm-4 hidden-xs">
          <small class="text-muted inline m-t-sm m-b-sm">每页显示：</small>
          <select class="input-sm form-control w-xxss inline v-middle" >
            <option value="0">10</option>
            <option value="1">25</option>
            <option value="2">50</option>
            <option value="3">100</option>
          </select>                
        </div>
 
        <div class="col-sm-4 text-center" id="ls">
          <small class="text-muted inline m-t-sm m-b-sm">显示1-10条记录内容</small>
        </div>
        <div class="col-sm-4 text-right text-center-xs">        
          <ul class="pagination-sm m-t-none m-b pagination ng-isolate-scope ng-valid ng-dirty ng-valid-parse" total-items="bigTotalItems" ng-model="bigCurrentPage" max-size="maxSize" boundary-links="true" rotate="false" num-pages="numPages">
            <!-- ngIf: boundaryLinks --><li ng-if="boundaryLinks" ng-class="{disabled: noPrevious()}" class="ng-scope"><a ng-click="selectPage(1)" class="ng-binding">首页</a></li><!-- end ngIf: boundaryLinks -->
            <!-- ngIf: directionLinks --><li ng-if="directionLinks" ng-class="{disabled: noPrevious()}" class="ng-scope"><a ng-click="selectPage(page - 1)" class="ng-binding">上一页</a></li><!-- end ngIf: directionLinks -->
            <!-- ngRepeat: page in pages track by $index --><li ng-repeat="page in pages track by $index" ng-class="{active: page.active}" class="ng-scope"><a ng-click="selectPage(page.number)" class="ng-binding">1</a></li><!-- end ngRepeat: page in pages track by $index --><li ng-repeat="page in pages track by $index" ng-class="{active: page.active}" class="ng-scope"><a ng-click="selectPage(page.number)" class="ng-binding">2</a></li><!-- end ngRepeat: page in pages track by $index --><li ng-repeat="page in pages track by $index" ng-class="{active: page.active}" class="ng-scope active"><a ng-click="selectPage(page.number)" class="ng-binding">3</a></li><!-- end ngRepeat: page in pages track by $index --><li ng-repeat="page in pages track by $index" ng-class="{active: page.active}" class="ng-scope"><a ng-click="selectPage(page.number)" class="ng-binding">4</a></li><!-- end ngRepeat: page in pages track by $index --><li ng-repeat="page in pages track by $index" ng-class="{active: page.active}" class="ng-scope"><a ng-click="selectPage(page.number)" class="ng-binding">5</a></li><!-- end ngRepeat: page in pages track by $index --><li ng-repeat="page in pages track by $index" ng-class="{active: page.active}" class="ng-scope"><a ng-click="selectPage(page.number)" class="ng-binding">...</a></li><!-- end ngRepeat: page in pages track by $index -->
            <!-- ngIf: directionLinks --><li ng-if="directionLinks" ng-class="{disabled: noNext()}" class="ng-scope"><a ng-click="selectPage(page + 1)" class="ng-binding">下一页</a></li><!-- end ngIf: directionLinks -->
            <!-- ngIf: boundaryLinks --><li ng-if="boundaryLinks" ng-class="{disabled: noNext()}" class="ng-scope"><a ng-click="selectPage(totalPages)" class="ng-binding">尾页</a></li><!-- end ngIf: boundaryLinks -->
          </ul>      
        </div>
      </div>
    </footer>
  </div>
</div>


