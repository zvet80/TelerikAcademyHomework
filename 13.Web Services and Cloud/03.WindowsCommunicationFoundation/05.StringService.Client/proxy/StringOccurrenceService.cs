﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.42000
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

using System.ServiceModel;

[System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
[System.ServiceModel.ServiceContractAttribute(ConfigurationName="IStringOccurrenceService")]
public interface IStringOccurrenceService
{
    
    [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IStringOccurrenceService/CountStringOccurrences", ReplyAction="http://tempuri.org/IStringOccurrenceService/CountStringOccurrencesResponse")]
    int CountStringOccurrences(string word, string text);
    
    [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IStringOccurrenceService/CountStringOccurrences", ReplyAction="http://tempuri.org/IStringOccurrenceService/CountStringOccurrencesResponse")]
    System.Threading.Tasks.Task<int> CountStringOccurrencesAsync(string word, string text);
}

[System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
public interface IStringOccurrenceServiceChannel : IStringOccurrenceService, System.ServiceModel.IClientChannel
{
}

[System.Diagnostics.DebuggerStepThroughAttribute()]
[System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
public partial class StringOccurrenceServiceClient : System.ServiceModel.ClientBase<IStringOccurrenceService>, IStringOccurrenceService
{
    
    public StringOccurrenceServiceClient()
    {
    }
    
    public StringOccurrenceServiceClient(string endpointConfigurationName) : 
            base(endpointConfigurationName)
    {
    }
    
    public StringOccurrenceServiceClient(string endpointConfigurationName, string remoteAddress) : 
            base(endpointConfigurationName, remoteAddress)
    {
    }
    
    public StringOccurrenceServiceClient(string endpointConfigurationName, System.ServiceModel.EndpointAddress remoteAddress) : 
            base(endpointConfigurationName, remoteAddress)
    {
    }
    
    public StringOccurrenceServiceClient(System.ServiceModel.Channels.Binding binding, System.ServiceModel.EndpointAddress remoteAddress) : 
            base(binding, remoteAddress)
    {
    }
    
    public int CountStringOccurrences(string word, string text)
    {
        return base.Channel.CountStringOccurrences(word, text);
    }
    
    public System.Threading.Tasks.Task<int> CountStringOccurrencesAsync(string word, string text)
    {
        return base.Channel.CountStringOccurrencesAsync(word, text);
    }
}