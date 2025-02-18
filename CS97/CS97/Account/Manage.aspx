﻿<%@ Page Title="管理帳戶" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Manage.aspx.cs" Inherits="CS97.Account.Manage" %>

<%@ Register Src="~/Account/OpenAuthProviders.ascx" TagPrefix="uc" TagName="OpenAuthProviders" %>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>

    <div>
        <asp:PlaceHolder runat="server" ID="successMessage" Visible="false" ViewStateMode="Disabled">
            <p class="text-success"><%: SuccessMessage %></p>
        </asp:PlaceHolder>
    </div>

    <div class="row">
        <div class="col-md-12">
            <div class="form-horizontal">
                <h4>變更您的帳戶設定</h4>
                <hr />
                <dl class="dl-horizontal">
                    <dt>密碼:</dt>
                    <dd>
                        <asp:HyperLink NavigateUrl="/Account/ManagePassword" Text="[變更]" Visible="false" ID="ChangePassword" runat="server" />
                        <asp:HyperLink NavigateUrl="/Account/ManagePassword" Text="[建立]" Visible="false" ID="CreatePassword" runat="server" />
                    </dd>
                    <dt>外部登入:</dt>
                    <dd><%: LoginsCount %>
                        <asp:HyperLink NavigateUrl="/Account/ManageLogins" Text="[管理]" runat="server" />

                    </dd>
                    <%--
                        電話號碼可以當做雙因素驗證系統中的第二個驗證因素。
                        如果設定此 ASP.NET 應用程式以使用 SMS 支援雙因素驗證的詳細資料，請參閱
                       <a href="http://go.microsoft.com/fwlink/?LinkId=403804">此文章</a>。
                        設定雙因素驗證後請取消註解以下區塊
                    --%>
                    <%--
                    <dt>電話號碼:</dt>
                    <% if (HasPhoneNumber)
                       { %>
                    <dd>
                        <asp:HyperLink NavigateUrl="/Account/AddPhoneNumber" runat="server" Text="[新增]" />
                    </dd>
                    <% }
                       else
                       { %>
                    <dd>
                        <asp:Label Text="" ID="PhoneNumber" runat="server" />
                        <asp:HyperLink NavigateUrl="/Account/AddPhoneNumber" runat="server" Text="[變更]" /> &nbsp;|&nbsp;
                        <asp:LinkButton Text="[移除]" OnClick="RemovePhone_Click" runat="server" />
                    </dd>
                    <% } %>
                    --%>

                    <dt>雙因素驗證:</dt>
                    <dd>
                        <p>
                            尚未設定雙因素驗證提供者。如果設定此 ASP.NET 應用程式以支援雙因素驗證的詳細資料，請參閱
                            <a href="http://go.microsoft.com/fwlink/?LinkId=403804">此文章</a>。
                        </p>
                        <% if (TwoFactorEnabled)
                          { %> 
                        <%--
                        已啟用
                        <asp:LinkButton Text="[Disable]" runat="server" CommandArgument="false" OnClick="TwoFactorDisable_Click" />
                        --%>
                        <% }
                          else
                          { %> 
                        <%--
                        已停用
                        <asp:LinkButton Text="[Enable]" CommandArgument="true" OnClick="TwoFactorEnable_Click" runat="server" />
                        --%>
                        <% } %>
                    </dd>
                </dl>
            </div>
        </div>
    </div>

</asp:Content>
